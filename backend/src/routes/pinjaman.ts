import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';
import multer from 'multer';
import path from 'path';

const router = Router();

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, 'pinjaman-' + uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage: storage });

// Helper for Plafon
async function hitungPlafonMaksimal(anggotaId: number) {
  const simpanan = await prisma.simpanan.findMany({ where: { anggotaId } });
  const totalSimpanan = simpanan.reduce((acc, curr) => acc + curr.saldo, 0);
  
  // Asumsi: Plafon Maksimal adalah 3x Total Simpanan (bisa diubah via PengaturanUmum)
  const pengaturan = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'MULTIPLIER_PLAFON' } });
  const multiplier = pengaturan ? parseFloat(pengaturan.nilai) : 3;
  
  return totalSimpanan * multiplier;
}

// GET all pinjaman
router.get('/', async (req: Request, res: Response) => {
  try {
    const pinjaman = await prisma.pinjaman.findMany({
      include: { anggota: true },
      orderBy: { createdAt: 'desc' }
    });
    res.json(pinjaman);
  } catch (error) {
    console.error('Error fetching pinjaman:', error);
    res.status(500).json({ error: 'Gagal mengambil data pinjaman' });
  }
});

// POST new pinjaman
router.post('/', upload.fields([{ name: 'ktpFile', maxCount: 1 }, { name: 'slipGajiFile', maxCount: 1 }]), async (req: Request, res: Response): Promise<any> => {
  try {
    const { anggotaId, nominal, tenor, skemaBunga } = req.body;
    
    const parsedNominal = parseFloat(nominal);
    const id = parseInt(anggotaId);

    const plafon = await hitungPlafonMaksimal(id);
    if (parsedNominal > plafon) {
      return res.status(400).json({ error: `Nominal melebihi plafon pinjaman maksimal (Rp ${plafon})` });
    }

    const files = req.files as { [fieldname: string]: Express.Multer.File[] };
    const fileKtpUrl = files['ktpFile'] ? `/uploads/${files['ktpFile'][0].filename}` : null;
    const fileSlipGajiUrl = files['slipGajiFile'] ? `/uploads/${files['slipGajiFile'][0].filename}` : null;

    // Hitung potongan biaya admin (misal 1%)
    const biayaAdmin = parsedNominal * 0.01;
    const nominalCair = parsedNominal - biayaAdmin;

    const newPinjaman = await prisma.pinjaman.create({
      data: {
        anggotaId: id,
        nominal: parsedNominal,
        tenor: parseInt(tenor),
        skemaBunga: skemaBunga || 'FLAT',
        bungaPersen: 1.5, // 1.5% per bulan
        biayaAdmin,
        nominalCair,
        plafonMaksimal: plafon,
        status: parsedNominal >= 10000000 ? 'PENDING_KETUA' : 'PENDING_ADMIN',
        fileKtpUrl,
        fileSlipGajiUrl
      },
      include: { anggota: true }
    });
    
    res.status(201).json({ message: 'Pengajuan pinjaman berhasil', data: newPinjaman });
  } catch (error) {
    console.error('Error creating pinjaman:', error);
    res.status(500).json({ error: 'Gagal menambahkan data pinjaman' });
  }
});

// PUT update status & Cairkan
router.put('/:id/status', async (req: Request, res: Response): Promise<any> => {
  try {
    const id = parseInt(req.params.id as string);
    const { status } = req.body; // e.g. DICAIRKAN
    
    const updatedPinjaman = await prisma.$transaction(async (tx) => {
      const pinjaman = await tx.pinjaman.findUnique({ where: { id } });
      if (!pinjaman) throw new Error('Pinjaman tidak ditemukan');
      if (pinjaman.status === 'DICAIRKAN') throw new Error('Pinjaman sudah pernah dicairkan');

      const updated = await tx.pinjaman.update({
        where: { id },
        data: {
          status,
          tanggalCair: status === 'DICAIRKAN' ? new Date() : undefined
        }
      });

      if (status === 'DICAIRKAN') {
        // Cek kas koperasi
        const kas = await tx.kasKoperasi.findFirst();
        if (!kas || kas.saldo < pinjaman.nominalCair) {
          throw new Error('Saldo kas koperasi tidak mencukupi untuk pencairan pinjaman ini');
        }

        // Potong kas
        const saldoBaru = kas.saldo - pinjaman.nominalCair;
        await tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: saldoBaru } });
        
        await tx.jurnalUmum.create({
          data: {
            keterangan: `Pencairan Pinjaman (ID: ${pinjaman.id}) a/n Anggota ${pinjaman.anggotaId}. Nominal: ${pinjaman.nominal}, Potongan: ${pinjaman.biayaAdmin}`,
            jenis: 'KREDIT',
            nominal: pinjaman.nominalCair,
            saldoSetelahnya: saldoBaru,
            referensiId: String(pinjaman.id),
            tipeReferensi: 'PINJAMAN'
          }
        });

        // Generate Angsuran (Skema Flat)
        const pokok = pinjaman.nominal / pinjaman.tenor;
        const bunga = pinjaman.nominal * (pinjaman.bungaPersen / 100);
        const tagihan = pokok + bunga;

        let angsuranData = [];
        let date = new Date();
        for (let i = 1; i <= pinjaman.tenor; i++) {
          let jatuhTempo = new Date(date.setMonth(date.getMonth() + 1));
          angsuranData.push({
            pinjamanId: pinjaman.id,
            bulanKe: i,
            nominalPokok: pokok,
            nominalBunga: bunga,
            totalTagihan: tagihan,
            jatuhTempo: jatuhTempo,
            status: 'BELUM_BAYAR' as const
          });
        }
        await tx.angsuran.createMany({ data: angsuranData });
      }

      return updated;
    });
    
    res.json({ message: 'Status berhasil diupdate', data: updatedPinjaman });
  } catch (error: any) {
    console.error('Error updating status pinjaman:', error);
    res.status(500).json({ error: error.message || 'Gagal memperbarui status pinjaman' });
  }
});

export default router;
