import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET rekap laporan kas & jurnal
router.get('/', async (req: Request, res: Response): Promise<any> => {
  try {
    const { startDate, endDate, jenis } = req.query;

    const filter: any = {};
    if (startDate && endDate) {
      filter.tanggal = {
        gte: new Date(startDate as string),
        lte: new Date(endDate as string)
      };
    }
    if (jenis) {
      filter.jenis = jenis as string; // 'DEBIT' | 'KREDIT'
    }

    const jurnalList = await prisma.jurnalUmum.findMany({
      where: filter,
      orderBy: { tanggal: 'desc' }
    });

    const totalDebit = await prisma.jurnalUmum.aggregate({
      where: { ...filter, jenis: 'DEBIT' },
      _sum: { nominal: true }
    });

    const totalKredit = await prisma.jurnalUmum.aggregate({
      where: { ...filter, jenis: 'KREDIT' },
      _sum: { nominal: true }
    });

    const kasSekarang = await prisma.kasKoperasi.findFirst();

    res.json({
      kasSekarang: kasSekarang?.saldo || 0,
      totalPemasukan: totalDebit._sum.nominal || 0,
      totalPengeluaran: totalKredit._sum.nominal || 0,
      jurnal: jurnalList
    });
  } catch (error) {
    console.error('Error fetching laporan:', error);
    res.status(500).json({ error: 'Gagal mengambil data laporan' });
  }
});

export default router;
