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
// Register Route (Mobile App)
router.post('/register-mobile', async (req: Request, res: Response): Promise<any> => {
  const { nip, namaLengkap, email, password } = req.body;

  try {
    // Check if NIP already exists
    const existing = await prisma.anggota.findUnique({ where: { nip } });
    if (existing) {
      return res.status(400).json({ error: 'NIP sudah terdaftar' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const anggota = await prisma.anggota.create({
      data: {
        nip,
        namaLengkap,
        email,
        password: hashedPassword,
        status: 'MENUNGGU_PERSETUJUAN'
      }
    });

    return res.json({ message: 'Pendaftaran berhasil. Silakan tunggu persetujuan Admin.', user: anggota });
  } catch (error) {
    console.error('Mobile Register error:', error);
    res.status(500).json({ error: 'Terjadi kesalahan pada server' });
  }
});

// Forgot PIN - OTP Simulation
router.post('/forgot-pin/otp', async (req: Request, res: Response): Promise<any> => {
  const { nip, email } = req.body;

  try {
    const anggota = await prisma.anggota.findUnique({ where: { nip } });
    if (!anggota || anggota.email !== email) {
      return res.status(400).json({ error: 'Data NIP atau Email tidak cocok' });
    }

    // In a real app, generate OTP and send via NodeMailer here.
    // For now, simulate success and assume OTP is '1234'
    return res.json({ message: 'OTP berhasil dikirim ke email Anda.' });
  } catch (error) {
    console.error('Forgot PIN OTP error:', error);
    res.status(500).json({ error: 'Terjadi kesalahan pada server' });
  }
});

// Forgot PIN - Admin Ticket via Chat
router.post('/forgot-pin/ticket', async (req: Request, res: Response): Promise<any> => {
  const { nip, email } = req.body;

  try {
    const anggota = await prisma.anggota.findUnique({ where: { nip } });
    if (!anggota) {
      return res.status(400).json({ error: 'NIP tidak ditemukan' });
    }

    // Buat tiket chat ke admin
    await prisma.chat.create({
      data: {
        pengirimId: 'system',
        penerimaId: 'admin',
        pesan: `TICKET LUPA PIN: Anggota NIP ${nip} (${anggota.namaLengkap}) memohon reset PIN. Email terdaftar: ${email}. Harap segera diproses.`,
        isRead: false
      }
    });

    return res.json({ message: 'Permohonan reset PIN telah dikirim ke Admin. Silakan tunggu dihubungi.' });
  } catch (error) {
    console.error('Forgot PIN Ticket error:', error);
    res.status(500).json({ error: 'Terjadi kesalahan pada server' });
  }
});

// Reset PIN (After OTP success)
router.post('/reset-pin', async (req: Request, res: Response): Promise<any> => {
  const { nip, otp, newPassword } = req.body;

  try {
    // Validate OTP (simulated to '1234')
    if (otp !== '1234') {
      return res.status(400).json({ error: 'OTP salah' });
    }

    const anggota = await prisma.anggota.findUnique({ where: { nip } });
    if (!anggota) {
      return res.status(400).json({ error: 'NIP tidak ditemukan' });
    }

    const hashedPassword = await bcrypt.hash(newPassword, 10);
    
    await prisma.anggota.update({
      where: { id: anggota.id },
      data: { password: hashedPassword }
    });

    return res.json({ message: 'PIN berhasil diubah. Silakan login kembali.' });
  } catch (error) {
    console.error('Reset PIN error:', error);
    res.status(500).json({ error: 'Terjadi kesalahan pada server' });
  }
});

// GET /me (Get Admin Profile)
router.get('/me', async (req: Request, res: Response): Promise<any> => {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader) return res.status(401).json({ error: 'Token tidak ditemukan' });
    
    const token = authHeader.split(' ')[1];
    const decoded: any = jwt.verify(token, JWT_SECRET);
    
    const user = await prisma.user.findUnique({
      where: { id: decoded.id },
      select: { id: true, username: true, name: true, role: true, createdAt: true }
    });
    
    if (!user) return res.status(404).json({ error: 'User tidak ditemukan' });
    res.json(user);
  } catch (error) {
    res.status(401).json({ error: 'Sesi tidak valid' });
  }
});

// PUT /me (Update Admin Profile)
router.put('/me', async (req: Request, res: Response): Promise<any> => {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader) return res.status(401).json({ error: 'Token tidak ditemukan' });
    
    const token = authHeader.split(' ')[1];
    const decoded: any = jwt.verify(token, JWT_SECRET);
    
    const { name, currentPassword, newPassword } = req.body;
    
    const user = await prisma.user.findUnique({ where: { id: decoded.id } });
    if (!user) return res.status(404).json({ error: 'User tidak ditemukan' });
    
    let updatedData: any = {};
    if (name) updatedData.name = name;
    
    if (newPassword && currentPassword) {
      const isMatch = await bcrypt.compare(currentPassword, user.password);
      if (!isMatch) return res.status(400).json({ error: 'Password saat ini salah' });
      updatedData.password = await bcrypt.hash(newPassword, 10);
    }
    
    const updatedUser = await prisma.user.update({
      where: { id: decoded.id },
      data: updatedData,
      select: { id: true, username: true, name: true, role: true }
    });
    
    res.json({ message: 'Profil berhasil diupdate', data: updatedUser });
  } catch (error) {
    res.status(500).json({ error: 'Gagal mengupdate profil' });
  }
});

export default router;
