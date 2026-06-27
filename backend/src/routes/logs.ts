import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET audit logs
router.get('/', async (req: Request, res: Response) => {
  try {
    const logs = await prisma.auditTrail.findMany({
      include: { user: { select: { name: true, username: true } } },
      orderBy: { createdAt: 'desc' },
      take: 200 // Limit for performance
    });
    res.json(logs);
  } catch (error) {
    console.error('Error fetching logs:', error);
    res.status(500).json({ error: 'Gagal mengambil data logs' });
  }
});

export default router;
