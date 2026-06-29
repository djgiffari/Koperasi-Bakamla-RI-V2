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

    // Calculate cashflow for the last 7 months
    const cashflowData = [];
    const monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des'];
    // Cari tanggal transaksi terbaru dan terlama untuk availableYears
    const lastMutasi = await prisma.mutasiSimpanan.findFirst({ orderBy: { createdAt: 'desc' } });
    const lastPinjaman = await prisma.pinjaman.findFirst({ orderBy: { createdAt: 'desc' } });
    const firstMutasi = await prisma.mutasiSimpanan.findFirst({ orderBy: { createdAt: 'asc' } });
    const firstPinjaman = await prisma.pinjaman.findFirst({ orderBy: { createdAt: 'asc' } });
    
    let now = new Date();
    if (lastMutasi || lastPinjaman) {
      const d1 = lastMutasi ? new Date(lastMutasi.createdAt) : new Date(0);
      const d2 = lastPinjaman ? new Date(lastPinjaman.createdAt) : new Date(0);
      now = d1 > d2 ? d1 : d2;
    }

    let minYear = now.getFullYear();
    if (firstMutasi || firstPinjaman) {
      const m1 = firstMutasi ? new Date(firstMutasi.createdAt) : new Date();
      const m2 = firstPinjaman ? new Date(firstPinjaman.createdAt) : new Date();
      const minDate = m1 < m2 ? m1 : m2;
      minYear = minDate.getFullYear();
    }
    
    const availableYears = [];
    for (let y = minYear; y <= now.getFullYear(); y++) {
      availableYears.push(y);
    }
    if (availableYears.length === 0) availableYears.push(now.getFullYear());

    const requestedYear = req.query.year ? parseInt(req.query.year as string) : null;
    
    if (requestedYear) {
      // Return 12 months for the specific year
      for (let i = 0; i < 12; i++) {
        const startOfMonth = new Date(requestedYear, i, 1);
        const endOfMonth = new Date(requestedYear, i + 1, 0, 23, 59, 59, 999);
        
        const mutasiMasuk = await prisma.mutasiSimpanan.aggregate({
          where: { jenisMutasi: 'SETORAN', status: 'DISETUJUI', createdAt: { gte: startOfMonth, lte: endOfMonth } },
          _sum: { nominal: true }
        });
        
        const angsuranMasuk = await prisma.angsuran.aggregate({
          where: { status: 'LUNAS', updatedAt: { gte: startOfMonth, lte: endOfMonth } },
          _sum: { totalTagihan: true }
        });
        
        const mutasiKeluar = await prisma.mutasiSimpanan.aggregate({
          where: { jenisMutasi: 'PENARIKAN', status: 'DISETUJUI', createdAt: { gte: startOfMonth, lte: endOfMonth } },
          _sum: { nominal: true }
        });
        
        const pinjamanKeluar = await prisma.pinjaman.aggregate({
          where: { status: { in: ['DICAIRKAN', 'LUNAS'] }, createdAt: { gte: startOfMonth, lte: endOfMonth } },
          _sum: { nominal: true }
        });
        
        cashflowData.push({
          name: `${monthNames[i]} ${requestedYear}`,
          Pemasukan: (mutasiMasuk._sum.nominal || 0) + (angsuranMasuk._sum.totalTagihan || 0),
          Simpanan: mutasiMasuk._sum.nominal || 0,
          Angsuran: angsuranMasuk._sum.totalTagihan || 0,
          Pengeluaran: (mutasiKeluar._sum.nominal || 0) + (pinjamanKeluar._sum.nominal || 0)
        });
      }
    } else {
      // Default: Last 7 months relative to 'now'
      for (let i = 6; i >= 0; i--) {
        const d = new Date(now.getFullYear(), now.getMonth() - i, 1);
        const startOfMonth = new Date(d.getFullYear(), d.getMonth(), 1);
        const endOfMonth = new Date(d.getFullYear(), d.getMonth() + 1, 0, 23, 59, 59, 999);
        
        const mutasiMasuk = await prisma.mutasiSimpanan.aggregate({
          where: { jenisMutasi: 'SETORAN', status: 'DISETUJUI', createdAt: { gte: startOfMonth, lte: endOfMonth } },
          _sum: { nominal: true }
        });
        
        const angsuranMasuk = await prisma.angsuran.aggregate({
          where: { status: 'LUNAS', updatedAt: { gte: startOfMonth, lte: endOfMonth } },
          _sum: { totalTagihan: true }
        });
        
        const mutasiKeluar = await prisma.mutasiSimpanan.aggregate({
          where: { jenisMutasi: 'PENARIKAN', status: 'DISETUJUI', createdAt: { gte: startOfMonth, lte: endOfMonth } },
          _sum: { nominal: true }
        });
        
        const pinjamanKeluar = await prisma.pinjaman.aggregate({
          where: { status: { in: ['DICAIRKAN', 'LUNAS'] }, createdAt: { gte: startOfMonth, lte: endOfMonth } },
          _sum: { nominal: true }
        });
        
        cashflowData.push({
          name: `${monthNames[d.getMonth()]} ${d.getFullYear()}`,
          Pemasukan: (mutasiMasuk._sum.nominal || 0) + (angsuranMasuk._sum.totalTagihan || 0),
          Simpanan: mutasiMasuk._sum.nominal || 0,
          Angsuran: angsuranMasuk._sum.totalTagihan || 0,
          Pengeluaran: (mutasiKeluar._sum.nominal || 0) + (pinjamanKeluar._sum.nominal || 0)
        });
      }
    }

    // Generate sales data for the last 7 days (mocking data from Toko module)
    // Karena modul toko belum ada/belum ada transaksi, kita set ke 0
    const salesData = [];
    const dayNames = ['Min', 'Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab'];
    for (let i = 6; i >= 0; i--) {
      const d = new Date(now.getFullYear(), now.getMonth(), now.getDate() - i);
      salesData.push({
        name: dayNames[d.getDay()],
        Penjualan: 0
      });
    }

    // Breakdown simpanan
    const simpananBreakdown = {
      pokok: allSimpanan.filter(s => s.jenisSimpanan === 'POKOK').reduce((a, b) => a + b.saldo, 0),
      wajib: allSimpanan.filter(s => s.jenisSimpanan === 'WAJIB').reduce((a, b) => a + b.saldo, 0),
      sukarela: allSimpanan.filter(s => s.jenisSimpanan === 'SUKARELA').reduce((a, b) => a + b.saldo, 0)
    };

    res.json({
      metrics: {
        totalAnggota,
        totalSimpanan,
        pinjamanAktif,
        omsetToko: 0, // dummy for now
        simpananBreakdown
      },
      pendingApprovals,
      recentActivities,
      charts: {
        cashflow: cashflowData,
        sales: salesData
      },
      availableYears
    });

  } catch (error) {
    console.error('Error fetching dashboard data:', error);
    res.status(500).json({ error: 'Gagal mengambil data dashboard' });
  }
});

router.get('/mobile/:anggotaId', async (req: Request, res: Response): Promise<any> => {
  try {
    const anggotaId = parseInt(req.params.anggotaId as string);
    
    // Validate member
    const anggota = await prisma.anggota.findUnique({
      where: { id: anggotaId }
    });

    if (!anggota) {
      return res.status(404).json({ error: 'Anggota tidak ditemukan' });
    }

    // Hitung total simpanan anggota
    const simpananList = await prisma.simpanan.findMany({
      where: { anggotaId }
    });
    const totalSimpanan = simpananList.reduce((acc, curr) => acc + curr.saldo, 0);

    // Hitung sisa pinjaman anggota
    const pinjamanList = await prisma.pinjaman.findMany({
      where: { 
        anggotaId,
        status: { in: ['DICAIRKAN', 'LUNAS'] }
      },
      include: {
        angsuran: true
      }
    });

    let sisaPinjaman = 0;
    for (const p of pinjamanList) {
      const angsuranLunas = p.angsuran.filter(a => a.status === 'LUNAS').reduce((acc, curr) => acc + curr.nominalPokok, 0);
      const totalHutang = p.nominal; // Simplifikasi
      sisaPinjaman += (totalHutang - angsuranLunas);
    }
    
    // Tagihan Bulan Ini
    const now = new Date();
    const tagihanBulanIni = await prisma.angsuran.findFirst({
      where: {
        pinjaman: { anggotaId },
        status: 'BELUM_BAYAR',
        jatuhTempo: {
          gte: new Date(now.getFullYear(), now.getMonth(), 1),
          lte: new Date(now.getFullYear(), now.getMonth() + 1, 0)
        }
      },
      orderBy: { jatuhTempo: 'asc' }
    });

    // SHU Tahun Ini
    const shuTahunIni = await prisma.riwayatSHU.findFirst({
      where: { anggotaId },
      orderBy: { createdAt: 'desc' }
    });

    res.json({
      anggotaId: anggota.id,
      namaLengkap: anggota.namaLengkap,
      nip: anggota.nip,
      createdAt: anggota.createdAt,
      totalSimpanan,
      sisaPinjaman,
      tagihanBulanIni: tagihanBulanIni ? tagihanBulanIni.totalTagihan : 0,
      jatuhTempoTagihan: tagihanBulanIni ? tagihanBulanIni.jatuhTempo : null,
      shuTahunIni: shuTahunIni ? shuTahunIni.totalSHU : 0
    });

  } catch (error) {
    console.error('Error fetching mobile dashboard data:', error);
    res.status(500).json({ error: 'Gagal mengambil data dashboard mobile' });
  }
});

export default router;
