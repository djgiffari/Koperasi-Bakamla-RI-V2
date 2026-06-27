import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';
import { auditLog } from '../utils/audit';

const router = Router();

// POST send broadcast message
router.post('/', auditLog('SEND_BROADCAST', 'Chat'), async (req: Request, res: Response): Promise<any> => {
  try {
    const { title, message } = req.body;

    if (!title || !message) {
      return res.status(400).json({ error: 'Judul dan isi pesan wajib diisi' });
    }

    const semuaAnggota = await prisma.anggota.findMany({ where: { status: 'AKTIF' }, select: { id: true } });
    
    // We will save to chat for now, where sender is "system" or "broadcast"
    const chatData = semuaAnggota.map(a => ({
      pengirimId: 'admin',
      penerimaId: String(a.id),
      pesan: `[BROADCAST] ${title}\n\n${message}`,
      isRead: false
    }));

    // In a real app with push notifications, we would trigger FCM (Firebase Cloud Messaging) here using anggota.fcmToken

    await prisma.chat.createMany({
      data: chatData
    });

    res.status(201).json({ message: 'Pesan siaran berhasil dikirim ke seluruh anggota aktif' });
  } catch (error) {
    console.error('Error sending broadcast:', error);
    res.status(500).json({ error: 'Gagal mengirim pesan siaran' });
  }
});

export default router;
