import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET all pengaturan
router.get('/', async (req: Request, res: Response) => {
  try {
    const { kategori } = req.query;
    const filter = kategori ? { kategori: kategori as string } : {};
    
    const data = await prisma.pengaturanUmum.findMany({
      where: filter,
      orderBy: { id: 'asc' }
    });
    res.json(data);
  } catch (error) {
    console.error('Error fetching pengaturan:', error);
    res.status(500).json({ error: 'Gagal mengambil data pengaturan' });
  }
});

// POST new pengaturan
router.post('/', async (req: Request, res: Response) => {
  try {
    const { kategori, nilai } = req.body;
    
    if (!kategori || !nilai) {
      return res.status(400).json({ error: 'Kategori dan nilai wajib diisi' });
    }

    const newData = await prisma.pengaturanUmum.create({
      data: {
        kategori,
        nilai
      }
    });
    
    res.status(201).json(newData);
  } catch (error) {
    console.error('Error creating pengaturan:', error);
    res.status(500).json({ error: 'Gagal menambahkan pengaturan' });
  }
});

// DELETE pengaturan
router.delete('/:id', async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    
    await prisma.pengaturanUmum.delete({
      where: { id }
    });
    
    res.json({ message: 'Pengaturan berhasil dihapus' });
  } catch (error) {
    console.error('Error deleting pengaturan:', error);
    res.status(500).json({ error: 'Gagal menghapus pengaturan' });
  }
});

export default router;
