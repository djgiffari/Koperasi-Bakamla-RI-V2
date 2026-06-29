import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';
import { auditLog } from '../utils/audit';

const router = Router();

// GET broadcast history
router.get('/', async (req: Request, res: Response): Promise<any> => {
  try {
    const history: any = await prisma.$queryRawUnsafe(`
      SELECT judul, pesan, "createdAt", COUNT(id) as terkirim 
      FROM "Notifikasi" 
      GROUP BY judul, pesan, "createdAt" 
      ORDER BY "createdAt" DESC
    `);
    res.json(history);
  } catch (error) {
    console.error('Error fetching broadcast history:', error);
    res.status(500).json({ error: 'Gagal mengambil riwayat siaran' });
  }
});

// POST send broadcast message
router.post('/', auditLog('SEND_BROADCAST', 'Chat'), async (req: Request, res: Response): Promise<any> => {
  try {
    const { title, message } = req.body;

    if (!title || !message) {
      return res.status(400).json({ error: 'Judul dan isi pesan wajib diisi' });
    }

    const semuaAnggota = await prisma.anggota.findMany({ where: { status: 'AKTIF' }, select: { id: true } });
    
    // Save to Notifikasi instead of Chat
    // Use an exact timestamp so we can group them as a single broadcast
    const exactTimestamp = new Date();
    
    for (const a of semuaAnggota) {
      await prisma.$executeRawUnsafe(
        'INSERT INTO "Notifikasi" ("anggotaId", judul, pesan, "isRead", "createdAt") VALUES ($1, $2, $3, false, $4)',
        a.id, title, message, exactTimestamp
      );
    }

    res.status(201).json({ message: 'Pesan siaran berhasil dikirim ke seluruh anggota aktif' });
  } catch (error) {
    console.error('Error sending broadcast:', error);
    res.status(500).json({ error: 'Gagal mengirim pesan siaran' });
  }
});

// DELETE broadcast
router.delete('/', auditLog('DELETE_BROADCAST', 'Notifikasi'), async (req: Request, res: Response): Promise<any> => {
  try {
    const { createdAt, judul } = req.body;

    if (!createdAt || !judul) {
      return res.status(400).json({ error: 'Data broadcast tidak lengkap' });
    }

    const date = new Date(createdAt);

    await prisma.$executeRawUnsafe(
      'DELETE FROM "Notifikasi" WHERE "createdAt" = $1 AND judul = $2',
      date, judul
    );

    res.json({ message: 'Riwayat broadcast berhasil dihapus' });
  } catch (error) {
    console.error('Error deleting broadcast:', error);
    res.status(500).json({ error: 'Gagal menghapus broadcast' });
  }
});

export default router;
