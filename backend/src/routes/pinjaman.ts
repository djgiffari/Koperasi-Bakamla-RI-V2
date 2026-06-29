import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';
import multer from 'multer';
import path from 'path';
import { authenticateToken } from '../middleware/auth';

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

// GET pinjaman by anggotaId (Mobile)
router.get('/mobile/:anggotaId', authenticateToken, async (req: Request, res: Response): Promise<any> => {
  try {
    const anggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(req.params.anggotaId as string);
    const pinjaman = await prisma.pinjaman.findMany({
      where: { anggotaId },
      include: {
        angsuran: true
      },
      orderBy: { createdAt: 'desc' }
    });
    res.json(pinjaman);
  } catch (error) {
    console.error('Error fetching pinjaman anggota:', error);
    res.status(500).json({ error: 'Gagal mengambil data pinjaman anggota' });
  }
});

// GET all angsuran
router.get('/angsuran', async (req: Request, res: Response) => {
  try {
    const angsuran = await prisma.angsuran.findMany({
      include: { 
        pinjaman: {
          include: { anggota: true }
        }
      },
      orderBy: { jatuhTempo: 'asc' }
    });
    res.json(angsuran);
  } catch (error) {
    console.error('Error fetching angsuran:', error);
    res.status(500).json({ error: 'Gagal mengambil data angsuran' });
  }
});

// POST new pinjaman
router.post('/', authenticateToken, upload.fields([{ name: 'ktpFile', maxCount: 1 }, { name: 'slipGajiFile', maxCount: 1 }]), async (req: Request, res: Response): Promise<any> => {
  try {
    const { anggotaId, nominal, tenor, skemaBunga } = req.body;
    
    const parsedNominal = parseFloat(nominal);
    if (parsedNominal <= 0) {
      return res.status(400).json({ error: 'Nominal pinjaman harus lebih besar dari 0' });
    }
    let validAnggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(anggotaId);
    const anggotaExist = await prisma.anggota.findUnique({ where: { id: validAnggotaId } });
    if (!anggotaExist) {
      return res.status(404).json({ error: 'Data anggota tidak ditemukan' });
    }

    const plafon = await hitungPlafonMaksimal(validAnggotaId);
    if (parsedNominal > plafon) {
      return res.status(400).json({ error: `Nominal melebihi plafon pinjaman maksimal (Rp ${plafon})` });
    }

    const files = (req.files || {}) as { [fieldname: string]: Express.Multer.File[] };
    const fileKtpUrl = files['ktpFile'] ? `/uploads/${files['ktpFile'][0].filename}` : null;
    const fileSlipGajiUrl = files['slipGajiFile'] ? `/uploads/${files['slipGajiFile'][0].filename}` : null;

    // Ambil Pengaturan Biaya
    const settingAdmin = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'BIAYA_ADMIN_PINJAMAN' } });
    const settingAsuransi = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'BIAYA_ASURANSI_PINJAMAN' } });
    const settingBunga = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'BUNGA_PINJAMAN' } });

    // Asumsi nilai persentase, default 1% admin, 0.5% asuransi, 1.5% bunga
    const persenAdmin = settingAdmin ? parseFloat(settingAdmin.nilai) : 1.0;
    const persenAsuransi = settingAsuransi ? parseFloat(settingAsuransi.nilai) : 0.5;
    const bungaPersen = settingBunga ? parseFloat(settingBunga.nilai) : 1.5;

    const biayaAdmin = parsedNominal * (persenAdmin / 100);
    const biayaAsuransi = parsedNominal * (persenAsuransi / 100);
    const nominalCair = parsedNominal - biayaAdmin - biayaAsuransi;

    const newPinjaman = await prisma.pinjaman.create({
      data: {
        anggotaId: validAnggotaId,
        nominal: parsedNominal,
        tenor: parseInt(tenor),
        skemaBunga: skemaBunga || 'FLAT',
        bungaPersen: bungaPersen,
        biayaAdmin,
        biayaAsuransi,
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
            keterangan: `Pencairan Pinjaman (ID: ${pinjaman.id}) a/n Anggota ${pinjaman.anggotaId}. Nominal: ${pinjaman.nominal}, Potongan Admin: ${pinjaman.biayaAdmin}, Potongan Asuransi: ${pinjaman.biayaAsuransi}`,
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
// DELETE pinjaman
router.delete('/:id', async (req: Request, res: Response): Promise<any> => {
  try {
    const id = parseInt(req.params.id as string);
    
    // Pastikan pinjaman belum dicairkan
    const pinjaman = await prisma.pinjaman.findUnique({ where: { id } });
    if (!pinjaman) return res.status(404).json({ error: 'Pinjaman tidak ditemukan' });
    if (pinjaman.status === 'DICAIRKAN' || pinjaman.status === 'LUNAS') {
      return res.status(400).json({ error: 'Pinjaman yang sudah dicairkan tidak dapat dihapus' });
    }

    // Hapus angsuran yang mungkin sudah terbuat
    await prisma.angsuran.deleteMany({ where: { pinjamanId: id } });
    
    await prisma.pinjaman.delete({ where: { id } });
    res.json({ message: 'Pinjaman berhasil dihapus' });
  } catch (error) {
    console.error('Error deleting pinjaman:', error);
    res.status(500).json({ error: 'Gagal menghapus pinjaman' });
  }
});

export default router;
