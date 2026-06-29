import express from 'express';
import { PrismaClient } from '@prisma/client';

const router = express.Router();
const prisma = new PrismaClient();

router.get('/riwayat/:anggotaId', async (req, res) => {
  try {
    const anggotaId = parseInt(req.params.anggotaId);

    // 1. Ambil mutasi simpanan
    const mutasi = await prisma.mutasiSimpanan.findMany({
      where: { anggotaId, status: 'DISETUJUI' },
    });

    // 2. Ambil pembayaran angsuran
    const angsuran = await prisma.angsuran.findMany({
      where: { pinjaman: { anggotaId }, status: 'LUNAS' },
      include: { pinjaman: true }
    });

    // 3. Ambil riwayat SHU pencairan
    const shu = await prisma.riwayatSHU.findMany({
      where: { anggotaId },
      include: { periode: true }
    });

    // 4. Ambil pencairan pinjaman
    const pinjaman = await prisma.pinjaman.findMany({
      where: { anggotaId, status: 'DICAIRKAN' }
    });

    // 5. Ambil pembelanjaan Toko (lewat tagihanPaylater yang LUNAS atau BELUM_BAYAR)
    const orderToko = await prisma.tagihanPaylater.findMany({
      where: { anggotaId },
      include: { order: true }
    });

    // Format jadi list tunggal
    const riwayat: any[] = [];

    mutasi.forEach(m => {
      riwayat.push({
        id: `mutasi_${m.id}`,
        tanggal: m.createdAt,
        jenis: m.jenisMutasi === 'SETORAN' ? 'masuk' : 'keluar',
        judul: `${m.jenisMutasi === 'SETORAN' ? 'Setoran' : 'Penarikan'} Simpanan ${m.jenisSimpanan.charAt(0) + m.jenisSimpanan.slice(1).toLowerCase()}`,
        nominal: m.nominal,
        status: m.status === 'DISETUJUI' ? 'SELESAI' : m.status,
      });
    });

    angsuran.forEach(a => {
      if (a.tanggalBayar) {
        riwayat.push({
          id: `angsuran_${a.id}`,
          tanggal: a.tanggalBayar,
          jenis: 'keluar',
          judul: `Pembayaran Angsuran ke-${a.bulanKe}`,
          nominal: a.totalTagihan,
          status: 'SELESAI',
        });
      }
    });

    shu.forEach(s => {
      riwayat.push({
        id: `shu_${s.id}`,
        tanggal: s.createdAt,
        jenis: 'masuk',
        judul: `Penerimaan SHU Tahun ${s.periode.tahun}`,
        nominal: s.totalSHU,
        status: 'SELESAI',
      });
    });

    pinjaman.forEach(p => {
      if (p.tanggalCair) {
        riwayat.push({
          id: `pinjaman_${p.id}`,
          tanggal: p.tanggalCair,
          jenis: 'masuk',
          judul: `Pencairan Pinjaman Umum`,
          nominal: p.nominalCair,
          status: 'SELESAI',
        });
      }
    });

    orderToko.forEach(ot => {
      riwayat.push({
        id: `toko_${ot.orderId}`,
        tanggal: ot.createdAt,
        jenis: 'keluar',
        judul: `Pembelanjaan Toko (${ot.order.metodePembayaran})`,
        nominal: ot.nominal,
        status: ot.order.status,
      });
    });

    // Urutkan terbaru ke terlama
    riwayat.sort((a, b) => b.tanggal.getTime() - a.tanggal.getTime());

    res.json(riwayat);
  } catch (error) {
    console.error('Error fetching riwayat transaksi:', error);
    res.status(500).json({ error: 'Gagal mengambil riwayat transaksi' });
  }
});

export default router;
