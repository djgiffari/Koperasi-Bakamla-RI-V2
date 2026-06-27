import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET all contacts (Anggota yang memiliki riwayat chat, atau semua anggota jika ingin memulai obrolan)
// Untuk Admin, kita ingin melihat semua anggota, dengan jumlah pesan belum terbaca dan pesan terakhir.
router.get('/contacts', async (req: Request, res: Response) => {
  try {
    // Ambil user ID yang punya riwayat chat dengan admin
    const chats = await prisma.chat.findMany({
      where: { OR: [{ pengirimId: 'admin' }, { penerimaId: 'admin' }] },
      select: { pengirimId: true, penerimaId: true }
    });
    
    const userIds = new Set<number>();
    chats.forEach(c => {
      if (c.pengirimId !== 'admin') {
        const id = parseInt(c.pengirimId);
        if (!isNaN(id)) userIds.add(id);
      }
      if (c.penerimaId !== 'admin') {
        const id = parseInt(c.penerimaId);
        if (!isNaN(id)) userIds.add(id);
      }
    });

    const anggotaList = await prisma.anggota.findMany({
      where: { id: { in: Array.from(userIds) }, status: 'AKTIF' },
      select: { id: true, namaLengkap: true, nip: true, fotoProfilUrl: true }
    });

    const contacts = await Promise.all(anggotaList.map(async (anggota) => {
      // Ambil pesan terakhir antara admin dan anggota
      const strId = String(anggota.id);
      const lastChat = await prisma.chat.findFirst({
        where: {
          OR: [
            { pengirimId: 'admin', penerimaId: strId },
            { pengirimId: strId, penerimaId: 'admin' }
          ]
        },
        orderBy: { createdAt: 'desc' }
      });

      // Hitung pesan yang belum terbaca oleh admin
      const unreadCount = await prisma.chat.count({
        where: {
          pengirimId: strId,
          penerimaId: 'admin',
          isRead: false
        }
      });

      return {
        id: anggota.id,
        name: anggota.namaLengkap,
        nip: anggota.nip,
        lastMessage: lastChat ? lastChat.pesan : '',
        time: lastChat ? lastChat.createdAt : null,
        unread: unreadCount,
        online: false // Ini bisa dikembangkan dengan Socket.IO di memori, untuk saat ini false
      };
    }));

    // Urutkan berdasarkan waktu pesan terakhir
    contacts.sort((a, b) => {
      if (!a.time) return 1;
      if (!b.time) return -1;
      return new Date(b.time).getTime() - new Date(a.time).getTime();
    });

    res.json(contacts);
  } catch (error) {
    console.error('Error fetching chat contacts:', error);
    res.status(500).json({ error: 'Gagal mengambil kontak' });
  }
});

// GET jumlah chat yang belum terbaca oleh admin (dari seluruh anggota)
router.get('/unread-count', async (req: Request, res: Response) => {
  try {
    const count = await prisma.chat.count({
      where: {
        penerimaId: 'admin',
        isRead: false
      }
    });
    res.json({ count });
  } catch (error) {
    console.error('Error fetching unread count:', error);
    res.status(500).json({ error: 'Gagal mengambil jumlah pesan belum terbaca' });
  }
});

// GET riwayat pesan spesifik untuk satu user
router.get('/:userId', async (req: Request, res: Response) => {
  try {
    const userId = req.params.userId as string; // userId dari anggota
    // Kita asumsikan endpoint ini dipanggil dari admin (penerimaId = admin, atau pengirimId = admin)
    // Atau dipanggil dari mobile app (penerimaId = userId, pengirimId = admin)
    
    const chats = await prisma.chat.findMany({
      where: {
        OR: [
          { pengirimId: 'admin', penerimaId: userId },
          { pengirimId: userId, penerimaId: 'admin' }
        ]
      },
      orderBy: { createdAt: 'asc' }
    });

    // Tandai semua pesan masuk dari user ini ke admin sebagai sudah terbaca jika dipanggil admin
    // Untuk fitur lebih kompleks, harusnya via role
    await prisma.chat.updateMany({
      where: { pengirimId: userId, penerimaId: 'admin', isRead: false },
      data: { isRead: true }
    });

    res.json(chats);
  } catch (error) {
    console.error('Error fetching chat history:', error);
    res.status(500).json({ error: 'Gagal mengambil riwayat pesan' });
  }
});

// POST send message
router.post('/', async (req: Request, res: Response) => {
  try {
    const { pengirimId, penerimaId, pesan } = req.body;
    const newChat = await prisma.chat.create({
      data: {
        pengirimId: String(pengirimId),
        penerimaId: String(penerimaId),
        pesan
      }
    });

    // Emit realtime event via Socket.io
    const io = req.app.get('io');
    if (io) {
      io.to(String(penerimaId)).emit('receive_message', newChat);
      // Juga kirim kembali ke pengirim jika mereka terhubung dari device lain
      io.to(String(pengirimId)).emit('message_sent', newChat);
    }

    res.status(201).json(newChat);
  } catch (error) {
    console.error('Error sending message:', error);
    res.status(500).json({ error: 'Gagal mengirim pesan' });
  }
});

// PUT tandai pesan terbaca
router.put('/read/:messageId', async (req: Request, res: Response) => {
  try {
    const messageId = req.params.messageId as string;
    await prisma.chat.update({
      where: { id: parseInt(messageId) },
      data: { isRead: true }
    });
    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: 'Gagal' });
  }
});

export default router;
