import { Router, Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
// import { PrismaClient } from '@prisma/client';

const router = Router();
// const prisma = new PrismaClient();

const JWT_SECRET = process.env.JWT_SECRET || 'secret_key_koperasi_bakamla_v2';

// Login Route
router.post('/login', async (req: Request, res: Response) => {
  const { username, password } = req.body;

  try {
    // For now, we will use a dummy admin check until Prisma schema is fully ready and migrated.
    if (username === 'admin' && password === 'admin123') {
      const token = jwt.sign(
        { id: 1, role: 'ADMIN', username: 'admin' },
        JWT_SECRET,
        { expiresIn: '1d' }
      );
      
      // Send token and basic user info
      return res.json({
        message: 'Login berhasil',
        token,
        user: { id: 1, username: 'admin', role: 'ADMIN', name: 'Administrator' }
      });
    }

    // Example of actual DB check once schema is generated:
    /*
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
    */

    return res.status(401).json({ error: 'Username atau password salah' });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ error: 'Terjadi kesalahan pada server' });
  }
});

export default router;
