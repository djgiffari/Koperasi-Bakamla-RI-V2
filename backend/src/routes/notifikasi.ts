import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET /unread/:anggotaId - get unread count
router.get('/unread/:anggotaId', async (req: Request, res: Response): Promise<any> => {
  try {
    const anggotaId = parseInt(req.params.anggotaId as string);
    
    // We use executeRaw because Prisma Client might not be fully generated yet for Notifikasi
    const result: any = await prisma.$queryRawUnsafe(
      `SELECT COUNT(*) as count FROM "Notifikasi" WHERE "anggotaId" = $1 AND "isRead" = false`,
      anggotaId
    );
    
    const count = Number(result[0]?.count || 0);
    res.json({ count });
  } catch (error) {
    console.error('Error fetching unread notifikasi count:', error);
    res.status(500).json({ error: 'Gagal mengambil jumlah notifikasi belum terbaca' });
  }
});

// GET /:anggotaId - get list
router.get('/:anggotaId', async (req: Request, res: Response): Promise<any> => {
  try {
    const anggotaId = parseInt(req.params.anggotaId as string);
    
    const result: any = await prisma.$queryRawUnsafe(
      `SELECT * FROM "Notifikasi" WHERE "anggotaId" = $1 ORDER BY "createdAt" DESC LIMIT 100`,
      anggotaId
    );
    
    res.json(result);
  } catch (error) {
    console.error('Error fetching notifikasi:', error);
    res.status(500).json({ error: 'Gagal mengambil daftar notifikasi' });
  }
});

// PUT /:id/read - mark single as read
router.put('/:id/read', async (req: Request, res: Response): Promise<any> => {
  try {
    const id = parseInt(req.params.id as string);
    
    await prisma.$executeRawUnsafe(
      `UPDATE "Notifikasi" SET "isRead" = true WHERE id = $1`,
      id
    );
    
    res.json({ message: 'Notifikasi ditandai sudah dibaca' });
  } catch (error) {
    console.error('Error marking notifikasi read:', error);
    res.status(500).json({ error: 'Gagal menandai notifikasi' });
  }
});

// PUT /read-all/:anggotaId - mark all as read
router.put('/read-all/:anggotaId', async (req: Request, res: Response): Promise<any> => {
  try {
    const anggotaId = parseInt(req.params.anggotaId as string);
    
    await prisma.$executeRawUnsafe(
      `UPDATE "Notifikasi" SET "isRead" = true WHERE "anggotaId" = $1`,
      anggotaId
    );
    
    res.json({ message: 'Semua notifikasi ditandai sudah dibaca' });
  } catch (error) {
    console.error('Error marking all notifikasi read:', error);
    res.status(500).json({ error: 'Gagal menandai semua notifikasi' });
  }
});

export default router;
