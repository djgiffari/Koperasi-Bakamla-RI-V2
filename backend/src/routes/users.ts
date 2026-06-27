import { Router, Request, Response } from 'express';
import bcrypt from 'bcrypt';
import prisma from '../utils/prisma';
import { auditLog } from '../utils/audit';

const router = Router();

// GET all users (admin dashboard)
router.get('/', async (req: Request, res: Response) => {
  try {
    const users = await prisma.user.findMany({
      select: {
        id: true,
        username: true,
        name: true,
        role: true,
        createdAt: true,
        updatedAt: true
      }
    });
    res.json(users);
  } catch (error) {
    console.error('Error fetching users:', error);
    res.status(500).json({ error: 'Gagal mengambil data user' });
  }
});

// POST new user
router.post('/', auditLog('CREATE_ADMIN', 'User'), async (req: Request, res: Response): Promise<any> => {
  try {
    const { username, password, name, role } = req.body;

    const existingUser = await prisma.user.findUnique({ where: { username } });
    if (existingUser) {
      return res.status(400).json({ error: 'Username sudah digunakan' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = await prisma.user.create({
      data: {
        username,
        password: hashedPassword,
        name,
        role: role || 'ADMIN'
      },
      select: { id: true, username: true, name: true, role: true }
    });

    res.status(201).json({ message: 'User berhasil ditambahkan', data: newUser });
  } catch (error) {
    console.error('Error creating user:', error);
    res.status(500).json({ error: 'Gagal menambahkan user' });
  }
});

// PUT reset password
router.put('/:id/reset-password', auditLog('RESET_PASSWORD_ADMIN', 'User'), async (req: Request, res: Response): Promise<any> => {
  try {
    const id = parseInt(req.params.id as string);
    const { newPassword } = req.body;

    if (!newPassword) {
      return res.status(400).json({ error: 'Password baru wajib diisi' });
    }

    const hashedPassword = await bcrypt.hash(newPassword, 10);

    await prisma.user.update({
      where: { id },
      data: { password: hashedPassword }
    });

    res.json({ message: 'Password berhasil direset' });
  } catch (error) {
    console.error('Error resetting password:', error);
    res.status(500).json({ error: 'Gagal mereset password' });
  }
});

// DELETE user
router.delete('/:id', auditLog('DELETE_ADMIN', 'User'), async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    
    // Mencegah hapus diri sendiri (ideal ditambahkan validasi session req.user.id)
    await prisma.user.delete({ where: { id } });

    res.json({ message: 'User berhasil dihapus' });
  } catch (error) {
    console.error('Error deleting user:', error);
    res.status(500).json({ error: 'Gagal menghapus user' });
  }
});

export default router;
