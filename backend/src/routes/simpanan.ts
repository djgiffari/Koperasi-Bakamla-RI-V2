import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

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

// POST new simpanan
router.post('/', async (req: Request, res: Response) => {
  try {
    const { anggotaId, jenisSimpanan, saldo } = req.body;
    
    const newSimpanan = await prisma.simpanan.create({
      data: {
        anggotaId: parseInt(anggotaId),
        jenisSimpanan: jenisSimpanan.toUpperCase(),
        saldo: parseFloat(saldo)
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
