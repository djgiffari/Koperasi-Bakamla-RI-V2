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
    cb(null, 'bukti-simpanan-' + uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage: storage });

// GET all mutasi simpanan (used by Dashboard and Simpanan list)
router.get('/', async (req: Request, res: Response) => {
  try {
    const mutasi = await prisma.mutasiSimpanan.findMany({
      include: { anggota: true },
      orderBy: { createdAt: 'desc' }
    });
    // Map data for frontend
    const mapped = mutasi.map((m: any) => ({
      ...m,
      saldo: m.nominal,
      kodeAkun: m.keterangan || '-',
      kodeInvoice: `INV-${m.id.toString().padStart(4, '0')}`
    }));
    res.json(mapped);
  } catch (error) {
    console.error('Error fetching mutasi:', error);
    res.status(500).json({ error: 'Gagal mengambil data mutasi simpanan' });
  }
});

// GET mutasi simpanan (backward compatibility)
router.get('/mutasi', async (req: Request, res: Response) => {
  try {
    const mutasi = await prisma.mutasiSimpanan.findMany({
      include: { anggota: true },
      orderBy: { createdAt: 'desc' }
    });
    res.json(mutasi);
  } catch (error) {
    res.status(500).json({ error: 'Gagal' });
  }
});

// GET all balances (Simpanan Induk)
router.get('/saldo/:anggotaId', async (req: Request, res: Response) => {
  try {
    const anggotaId = parseInt(req.params.anggotaId as string);
    const simpanan = await prisma.simpanan.findMany({
      where: { anggotaId }
    });
    res.json(simpanan);
  } catch (error) {
    res.status(500).json({ error: 'Gagal mengambil data saldo simpanan' });
  }
});

// GET riwayat mutasi simpanan untuk anggota tertentu
router.get('/riwayat/:anggotaId', async (req: Request, res: Response) => {
  try {
    const anggotaId = parseInt(req.params.anggotaId as string);
    const mutasi = await prisma.mutasiSimpanan.findMany({
      where: { anggotaId },
      orderBy: { createdAt: 'desc' }
    });
    res.json(mutasi);
  } catch (error) {
    res.status(500).json({ error: 'Gagal mengambil riwayat simpanan' });
  }
});

// POST setor simpanan (Create Mutasi SETORAN) - Used by frontend POST /simpanan
router.post('/', upload.single('buktiFile'), async (req: Request, res: Response): Promise<any> => {
  try {
    const { anggotaId, jenisSimpanan, saldo, nominal, kodeAkun, keterangan, tanggal } = req.body;
    
    if (!['POKOK', 'WAJIB', 'SUKARELA'].includes(jenisSimpanan)) {
      return res.status(400).json({ error: 'Jenis simpanan tidak valid' });
    }

    const amount = parseFloat(saldo || nominal || '0');

    let buktiUrl = null;
    if (req.file) {
      buktiUrl = `/uploads/${req.file.filename}`;
    }

    const newMutasi = await prisma.mutasiSimpanan.create({
      data: {
        anggotaId: parseInt(anggotaId),
        jenisSimpanan: jenisSimpanan as any,
        jenisMutasi: 'SETORAN',
        nominal: amount,
        keterangan: kodeAkun || keterangan || null,
        buktiUrl: buktiUrl,
        status: 'MENUNGGU_VERIFIKASI',
        isDivalidasiBank: false,
        createdAt: tanggal ? new Date(tanggal) : undefined
      }
    });
    
    res.status(201).json({ message: 'Setoran berhasil dicatat', data: newMutasi });
  } catch (error) {
    console.error('Error creating setoran:', error);
    res.status(500).json({ error: 'Gagal menambahkan setoran simpanan' });
  }
});

// PUT verifikasi mutasi
router.put('/:id/status', async (req: Request, res: Response): Promise<any> => {
  try {
    const id = parseInt(req.params.id as string);
    const { status, isDivalidasiBank } = req.body;

    if (!['MENUNGGU_VERIFIKASI', 'DISETUJUI', 'DITOLAK'].includes(status)) {
      return res.status(400).json({ error: 'Status tidak valid' });
    }

    const updatedMutasi = await prisma.$transaction(async (tx) => {
      const mutasi = await tx.mutasiSimpanan.findUnique({ where: { id } });
      if (!mutasi) throw new Error('Mutasi tidak ditemukan');
      if (mutasi.status === 'DISETUJUI') throw new Error('Mutasi sudah pernah disetujui');

      const updated = await tx.mutasiSimpanan.update({
        where: { id },
        data: { 
          status,
          isDivalidasiBank: isDivalidasiBank !== undefined ? isDivalidasiBank : mutasi.isDivalidasiBank
        }
      });

      if (status === 'DISETUJUI') {
        let simpananInduk = await tx.simpanan.findFirst({
          where: { anggotaId: mutasi.anggotaId, jenisSimpanan: mutasi.jenisSimpanan }
        });

        if (!simpananInduk) {
          simpananInduk = await tx.simpanan.create({
            data: { anggotaId: mutasi.anggotaId, jenisSimpanan: mutasi.jenisSimpanan, saldo: 0 }
          });
        }

        const saldoBaru = mutasi.jenisMutasi === 'SETORAN' 
          ? simpananInduk.saldo + mutasi.nominal
          : simpananInduk.saldo - mutasi.nominal;

        await tx.simpanan.update({
          where: { id: simpananInduk.id },
          data: { saldo: saldoBaru }
        });

        const kas = await tx.kasKoperasi.findFirst();
        if (kas) {
           const saldoKasBaru = mutasi.jenisMutasi === 'SETORAN' ? kas.saldo + mutasi.nominal : kas.saldo - mutasi.nominal;
           await tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: saldoKasBaru } });
           
           await tx.jurnalUmum.create({
              data: {
                keterangan: `Verifikasi ${mutasi.jenisMutasi} Simpanan ${mutasi.jenisSimpanan} - Anggota ${mutasi.anggotaId}`,
                jenis: mutasi.jenisMutasi === 'SETORAN' ? 'DEBIT' : 'KREDIT',
                nominal: mutasi.nominal,
                saldoSetelahnya: saldoKasBaru,
                referensiId: String(mutasi.id),
                tipeReferensi: 'SIMPANAN'
              }
           });
        }
      }

      return updated;
    });

    res.json({ message: 'Status mutasi berhasil diupdate', data: updatedMutasi });
  } catch (error: any) {
    res.status(500).json({ error: error.message || 'Gagal mengubah status mutasi' });
  }
});

router.delete('/:id', async (req: Request, res: Response) => {
  try {
    await prisma.mutasiSimpanan.delete({
      where: { id: parseInt(req.params.id as string) }
    });
    res.json({ message: 'Deleted' });
  } catch (e) {
    res.status(500).json({ error: 'Failed' });
  }
});

// POST penarikan simpanan sukarela
router.post('/tarik', async (req: Request, res: Response): Promise<any> => {
  try {
    const { anggotaId, nominal, bankTujuan, rekeningTujuan } = req.body;
    
    const simpananSukarela = await prisma.simpanan.findFirst({
      where: { anggotaId: parseInt(anggotaId), jenisSimpanan: 'SUKARELA' }
    });

    if (!simpananSukarela || simpananSukarela.saldo < parseFloat(nominal)) {
      return res.status(400).json({ error: 'Saldo simpanan sukarela tidak mencukupi' });
    }

    const penarikan = await prisma.penarikanSimpanan.create({
      data: {
        anggotaId: parseInt(anggotaId),
        nominal: parseFloat(nominal),
        bankTujuan,
        rekeningTujuan,
        status: 'MENUNGGU_PERSETUJUAN'
      }
    });
    
    res.status(201).json({ message: 'Pengajuan penarikan berhasil, menunggu proses pencairan', data: penarikan });
  } catch (error) {
    console.error('Error pengajuan penarikan:', error);
    res.status(500).json({ error: 'Gagal mengajukan penarikan' });
  }
});

export default router;
