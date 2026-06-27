import { Router, Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import { PrismaClient } from '@prisma/client';

const router = Router();
const prisma = new PrismaClient();

const JWT_SECRET = process.env.JWT_SECRET || 'secret_key_koperasi_bakamla_v2';

// Login Route (Web Admin)
router.post('/login', async (req: Request, res: Response): Promise<any> => {
  const { username, password } = req.body;

  try {
    const user = await prisma.user.findUnique({ where: { username } });
    if (!user) {
      return res.status(401).json({ error: 'Username atau password salah' });
    }
    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(401).json({ error: 'Username atau password salah' });
    }
    const token = jwt.sign(
      { id: user.id, role: user.role, username: user.username },
      JWT_SECRET,
      { expiresIn: '1d' }
    );
    return res.json({ message: 'Login berhasil', token, user });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ error: 'Terjadi kesalahan pada server' });
  }
});

// Login Route (Mobile App / Anggota)
router.post('/login-mobile', async (req: Request, res: Response): Promise<any> => {
  const { nip, password, fcmToken } = req.body;

  try {
    const anggota = await prisma.anggota.findUnique({ where: { nip } });
    if (!anggota) {
      return res.status(401).json({ error: 'NIP tidak terdaftar' });
    }
    
    // Check if password exists (some members might not be activated yet)
    if (!anggota.password) {
      return res.status(403).json({ error: 'Akun belum diaktifkan. Silakan hubungi admin.' });
    }

    const isPasswordValid = await bcrypt.compare(password, anggota.password);
    if (!isPasswordValid) {
      return res.status(401).json({ error: 'Password salah' });
    }

    if (anggota.status !== 'AKTIF') {
       return res.status(403).json({ error: `Akun anda ${anggota.status}. Tidak dapat login.` });
    }

    // Update FCM token if provided
    if (fcmToken) {
      await prisma.anggota.update({
        where: { id: anggota.id },
        data: { fcmToken }
      });
    }

    const token = jwt.sign(
      { id: anggota.id, role: 'ANGGOTA', nip: anggota.nip },
      JWT_SECRET,
      { expiresIn: '30d' } // Mobile app usually has longer sessions
    );
    return res.json({ message: 'Login berhasil', token, user: anggota });
  } catch (error) {
    console.error('Mobile Login error:', error);
    res.status(500).json({ error: 'Terjadi kesalahan pada server' });
  }
});

export default router;
