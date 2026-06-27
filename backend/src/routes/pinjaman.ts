import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET all pinjaman
router.get('/', async (req: Request, res: Response) => {
  try {
    const pinjaman = await prisma.pinjaman.findMany({
      include: {
        anggota: true
      },
      orderBy: { createdAt: 'desc' }
    });
    res.json(pinjaman);
  } catch (error) {
    console.error('Error fetching pinjaman:', error);
    res.status(500).json({ error: 'Gagal mengambil data pinjaman' });
  }
});

// POST new pinjaman
router.post('/', async (req: Request, res: Response) => {
  try {
    const { anggotaId, nominal, tenor } = req.body;
    
    const newPinjaman = await prisma.pinjaman.create({
      data: {
        anggotaId: parseInt(anggotaId),
        nominal: parseFloat(nominal),
        tenor: parseInt(tenor),
        status: 'PENDING_ADMIN'
      },
      include: {
        anggota: true
      }
    });
    
    res.status(201).json(newPinjaman);
  } catch (error) {
    console.error('Error creating pinjaman:', error);
    res.status(500).json({ error: 'Gagal menambahkan data pinjaman' });
  }
});

// PUT update status pinjaman
router.put('/:id/status', async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    const { status } = req.body;
    
    const updatedPinjaman = await prisma.pinjaman.update({
      where: { id },
      data: {
        status,
        tanggalCair: status === 'DICAIRKAN' ? new Date() : undefined
      }
    });
    
    res.json(updatedPinjaman);
  } catch (error) {
    console.error('Error updating status pinjaman:', error);
    res.status(500).json({ error: 'Gagal memperbarui status pinjaman' });
  }
});

// DELETE pinjaman
router.delete('/:id', async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    
    await prisma.pinjaman.delete({
      where: { id }
    });
    
    res.json({ message: 'Pinjaman berhasil dihapus' });
  } catch (error) {
    console.error('Error deleting pinjaman:', error);
    res.status(500).json({ error: 'Gagal menghapus data pinjaman' });
  }
});

export default router;
