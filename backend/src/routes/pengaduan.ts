import express from 'express';
// Trigger IDE Cache Refresh
import { PrismaClient } from '@prisma/client';

import multer from 'multer';
import path from 'path';
import { authenticateToken } from '../middleware/auth';

const router = express.Router();
const prisma = new PrismaClient();

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, 'pengaduan-' + uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage: storage });

// ==========================================
// MOBILE ENDPOINTS
// ==========================================

// Create new Pengaduan
router.post('/', authenticateToken, upload.single('lampiranFile'), async (req: any, res: any): Promise<any> => {
  try {
    const { anggotaId, kategori, subjek, deskripsi } = req.body;
    
    if (!anggotaId || !kategori || !subjek || !deskripsi) {
      return res.status(400).json({ error: 'Data tidak lengkap' });
    }

    const fileUrl = req.file ? `/uploads/${req.file.filename}` : null;

    let validAnggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(anggotaId);
    const anggotaExist = await prisma.anggota.findUnique({ where: { id: validAnggotaId } });
    if (!anggotaExist) {
      return res.status(404).json({ error: 'Data anggota tidak ditemukan' });
    }

    const pengaduan = await prisma.pengaduan.create({
      data: {
        anggotaId: validAnggotaId,
        kategori,
        subjek,
        deskripsi,
        lampiranUrl: fileUrl,
      }
    });

    res.json({ message: 'Pengaduan berhasil dikirim', pengaduan });
  } catch (error) {
    console.error('Error creating pengaduan:', error);
    res.status(500).json({ error: 'Gagal mengirim pengaduan' });
  }
});

// Get user's Pengaduan history
router.get('/mobile/:anggotaId', authenticateToken, async (req: any, res: any): Promise<any> => {
  try {
    const anggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(req.params.anggotaId);
    const riwayat = await prisma.pengaduan.findMany({
      where: { anggotaId },
      orderBy: { createdAt: 'desc' }
    });
    res.json(riwayat);
  } catch (error) {
    console.error('Error fetching pengaduan:', error);
    res.status(500).json({ error: 'Gagal memuat riwayat pengaduan' });
  }
});

// ==========================================
// ADMIN ENDPOINTS
// ==========================================

// Get all Pengaduan
router.get('/admin', async (req, res) => {
  try {
    const pengaduan = await prisma.pengaduan.findMany({
      include: {
        anggota: {
          select: { namaLengkap: true, nip: true, pangkat: true, unitKerja: true }
        }
      },
      orderBy: { createdAt: 'desc' }
    });
    res.json(pengaduan);
  } catch (error) {
    console.error('Error fetching all pengaduan:', error);
    res.status(500).json({ error: 'Gagal memuat data pengaduan' });
  }
});

// Update status / reply Pengaduan
router.put('/admin/:id/status', async (req, res) => {
  try {
    const { id } = req.params;
    const { status, balasanAdmin } = req.body;

    const updated = await prisma.pengaduan.update({
      where: { id: parseInt(id) },
      data: {
        status,
        balasanAdmin: balasanAdmin !== undefined ? balasanAdmin : undefined
      }
    });

    res.json({ message: 'Status berhasil diperbarui', updated });
  } catch (error) {
    console.error('Error updating pengaduan:', error);
    res.status(500).json({ error: 'Gagal memperbarui pengaduan' });
  }
});

export default router;
