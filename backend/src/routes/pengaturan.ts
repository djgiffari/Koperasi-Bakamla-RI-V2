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

// POST bulk update single settings
router.post('/bulk-update', async (req: Request, res: Response): Promise<any> => {
  try {
    const settings: { kategori: string, nilai: string }[] = req.body;
    
    if (!Array.isArray(settings)) {
      return res.status(400).json({ error: 'Body harus berupa array' });
    }

    // Gunakan transaction
    await prisma.$transaction(async (tx) => {
      for (const item of settings) {
        // Hapus yang lama (untuk kategori yang sifatnya single)
        await tx.pengaturanUmum.deleteMany({
          where: { kategori: item.kategori }
        });
        
        // Buat baru
        await tx.pengaturanUmum.create({
          data: {
            kategori: item.kategori,
            nilai: item.nilai
          }
        });
      }
    });

    res.json({ message: 'Pengaturan berhasil diperbarui' });
  } catch (error) {
    console.error('Error bulk update pengaturan:', error);
    res.status(500).json({ error: 'Gagal memperbarui pengaturan' });
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
