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

// GET all simpanan
router.get('/', async (req: Request, res: Response) => {
  try {
    const simpanan = await prisma.simpanan.findMany({
      include: {
        anggota: true
      },
      orderBy: { createdAt: 'desc' }
    });
    res.json(simpanan);
  } catch (error) {
    console.error('Error fetching simpanan:', error);
    res.status(500).json({ error: 'Gagal mengambil data simpanan' });
  }
});

// Helper to generate Invoice Code
async function generateInvoiceCode() {
  const date = new Date();
  const yyyy = date.getFullYear();
  const mm = String(date.getMonth() + 1).padStart(2, '0');
  const prefix = `SA-${yyyy}${mm}-`;

  const lastSimpanan = await prisma.simpanan.findFirst({
    where: {
      kodeInvoice: {
        startsWith: prefix
      }
    },
    orderBy: {
      id: 'desc'
    }
  });

  let seq = 1;
  if (lastSimpanan && lastSimpanan.kodeInvoice) {
    const lastSeqStr = lastSimpanan.kodeInvoice.replace(prefix, '');
    const lastSeq = parseInt(lastSeqStr, 10);
    if (!isNaN(lastSeq)) {
      seq = lastSeq + 1;
    }
  }

  const seqStr = String(seq).padStart(3, '0');
  return `${prefix}${seqStr}`;
}

// POST new simpanan
router.post('/', upload.single('buktiFile'), async (req: Request, res: Response) => {
  try {
    const { anggotaId, jenisSimpanan, saldo, kodeAkun, tanggal } = req.body;
    
    let buktiUrl = null;
    if (req.file) {
      buktiUrl = `/uploads/${req.file.filename}`;
    }

    const kodeInvoice = await generateInvoiceCode();

    const newSimpanan = await prisma.simpanan.create({
      data: {
        anggotaId: parseInt(anggotaId),
        jenisSimpanan: jenisSimpanan,
        saldo: parseFloat(saldo),
        kodeAkun: kodeAkun || null,
        kodeInvoice: kodeInvoice,
        buktiUrl: buktiUrl,
        status: 'MENUNGGU_PERSETUJUAN',
        createdAt: tanggal ? new Date(tanggal) : new Date()
      },
      include: {
        anggota: true
      }
    });
    
    res.status(201).json(newSimpanan);
  } catch (error) {
    console.error('Error creating simpanan:', error);
    res.status(500).json({ error: 'Gagal menambahkan data simpanan' });
  }
});

// PUT update simpanan status
router.put('/:id/status', async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    const { status } = req.body;

    if (!['MENUNGGU_PERSETUJUAN', 'DISETUJUI', 'DITOLAK'].includes(status)) {
      return res.status(400).json({ error: 'Status tidak valid' });
    }

    const updatedSimpanan = await prisma.simpanan.update({
      where: { id },
      data: { status }
    });

    res.json(updatedSimpanan);
  } catch (error) {
    console.error('Error updating status:', error);
    res.status(500).json({ error: 'Gagal mengubah status' });
  }
});

// DELETE simpanan
router.delete('/:id', async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    
    await prisma.simpanan.delete({
      where: { id }
    });
    
    res.json({ message: 'Simpanan berhasil dihapus' });
  } catch (error) {
    console.error('Error deleting simpanan:', error);
    res.status(500).json({ error: 'Gagal menghapus data simpanan' });
  }
});

export default router;
