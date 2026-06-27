import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET all angsuran
router.get('/', async (req: Request, res: Response) => {
  try {
    const angsuran = await prisma.angsuran.findMany({
      include: {
        pinjaman: {
          include: {
            anggota: true
          }
        }
      },
      orderBy: { createdAt: 'desc' }
    });
    res.json(angsuran);
  } catch (error) {
    console.error('Error fetching angsuran:', error);
    res.status(500).json({ error: 'Gagal mengambil data angsuran' });
  }
});

export default router;
