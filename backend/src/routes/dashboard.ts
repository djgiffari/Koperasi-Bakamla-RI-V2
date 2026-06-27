import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

router.get('/', async (req: Request, res: Response) => {
  try {
    const totalAnggota = await prisma.anggota.count();
    
    const allSimpanan = await prisma.simpanan.findMany();
    const totalSimpanan = allSimpanan.reduce((acc, curr) => acc + curr.saldo, 0);

    const allPinjaman = await prisma.pinjaman.findMany({
      where: {
        status: {
          notIn: ['LUNAS', 'DITOLAK']
        }
      }
    });
    const pinjamanAktif = allPinjaman.reduce((acc, curr) => acc + curr.nominal, 0);

    // Get recent activities (last 5 pinjaman or simpanan)
    const recentSimpanan = await prisma.simpanan.findMany({
      take: 3,
      orderBy: { createdAt: 'desc' },
      include: { anggota: true }
    });
    
    const recentPinjaman = await prisma.pinjaman.findMany({
      take: 3,
      orderBy: { createdAt: 'desc' },
      include: { anggota: true }
    });

    const pendingApprovals = [
      ...recentPinjaman.filter(p => p.status === 'PENDING_ADMIN' || p.status === 'PENDING_BENDAHARA').map(p => ({
        id: `PNJ-${p.id}`,
        name: p.anggota?.namaLengkap || 'Unknown',
        type: 'Pinjaman',
        amount: `Rp ${p.nominal.toLocaleString('id-ID')}`,
        date: p.createdAt.toISOString()
      }))
    ];

    const recentActivities = [
      ...recentSimpanan.map(s => ({
        id: `s-${s.id}`,
        name: s.anggota?.namaLengkap || 'Unknown',
        action: `Menyetor Simpanan ${s.jenisSimpanan}`,
        time: s.createdAt.toISOString(),
        status: 'success'
      })),
      ...recentPinjaman.map(p => ({
        id: `p-${p.id}`,
        name: p.anggota?.namaLengkap || 'Unknown',
        action: 'Mengajukan Pinjaman',
        time: p.createdAt.toISOString(),
        status: p.status === 'DICAIRKAN' ? 'success' : 'pending'
      }))
    ].sort((a, b) => new Date(b.time).getTime() - new Date(a.time).getTime()).slice(0, 5);

    res.json({
      metrics: {
        totalAnggota,
        totalSimpanan,
        pinjamanAktif,
        omsetToko: 0 // dummy for now
      },
      pendingApprovals,
      recentActivities
    });

  } catch (error) {
    console.error('Error fetching dashboard data:', error);
    res.status(500).json({ error: 'Gagal mengambil data dashboard' });
  }
});

export default router;
