import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET Estimasi SHU untuk seorang Anggota (dipanggil oleh Mobile Dashboard)
router.get('/estimasi/:anggotaId', async (req: Request, res: Response): Promise<any> => {
  try {
    const anggotaId = parseInt(req.params.anggotaId as string);
    
    // 1. Hitung Laba Kotor (Total Pemasukan Murni)
    const currentYear = new Date().getFullYear();
    const startDate = new Date(`${currentYear}-01-01`);
    const endDate = new Date(`${currentYear}-12-31`);

    // A. Pemasukan dari Pinjaman (Bunga & Denda yang sudah dibayar)
    const angsuranLunas = await prisma.angsuran.aggregate({
      where: { status: 'LUNAS', tanggalBayar: { gte: startDate, lte: endDate } },
      _sum: { nominalBunga: true, dendaKeterlambatan: true }
    });
    const pendapatanBunga = (angsuranLunas._sum.nominalBunga || 0) + (angsuranLunas._sum.dendaKeterlambatan || 0);

    // B. Pemasukan dari Potongan Biaya Pinjaman (Cair tahun ini)
    const pinjamanCair = await prisma.pinjaman.aggregate({
      where: { status: 'DICAIRKAN', tanggalCair: { gte: startDate, lte: endDate } },
      _sum: { biayaAdmin: true, biayaAsuransi: true }
    });
    const pendapatanBiayaPinjaman = (pinjamanCair._sum.biayaAdmin || 0) + (pinjamanCair._sum.biayaAsuransi || 0);

    // C. Pemasukan dari Margin Toko Koperasi
    // Harus iterasi order items karena harga Modal ada di Produk
    const orderSelesai = await prisma.orderItem.findMany({
      where: { order: { status: 'SELESAI', createdAt: { gte: startDate, lte: endDate } } },
      include: { produk: true }
    });
    const pendapatanToko = orderSelesai.reduce((acc, item) => {
      const margin = item.hargaSatuan - item.produk.hargaModal;
      return acc + (margin * item.jumlah);
    }, 0);

    // D. Pengaturan Biaya Operasional & Persentase SHU dari Admin
    const setOperasional = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'BIAYA_OPERASIONAL_TAHUNAN' } });
    const biayaOperasional = setOperasional ? parseFloat(setOperasional.nilai) : 0;
    
    const setPersenShu = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'PERSENTASE_SHU_DIBAGIKAN' } });
    const persenShuDibagikan = setPersenShu ? parseFloat(setPersenShu.nilai) / 100 : 0.8; // default 80% laba dibagikan

    const totalLabaBersih = pendapatanBunga + pendapatanBiayaPinjaman + pendapatanToko - biayaOperasional;
    const totalShuBerjalan = totalLabaBersih > 0 ? totalLabaBersih * persenShuDibagikan : 0;

    // Parameter pembagian (misal: Jasa Modal 40%, Jasa Anggota 60%)
    const porsiJasaModal = 0.4;
    const porsiJasaAnggota = 0.6;

    // 2. Hitung Jasa Modal Anggota
    const simpananAnggotaList = await prisma.simpanan.findMany({ where: { anggotaId } });
    const simpananAnggota = simpananAnggotaList.reduce((acc, curr) => acc + curr.saldo, 0);

    const semuaSimpanan = await prisma.simpanan.aggregate({ _sum: { saldo: true } });
    const totalSimpananKoperasi = semuaSimpanan._sum.saldo || 1; 

    const bagianJasaModal = (simpananAnggota / totalSimpananKoperasi) * (totalShuBerjalan * porsiJasaModal);

    // 3. Hitung Jasa Anggota (Berdasarkan Pinjaman & Belanja)
    const pinjamanAnggota = await prisma.pinjaman.aggregate({
      where: { anggotaId, status: 'DICAIRKAN' },
      _sum: { nominal: true }
    });
    const orderAnggota = await prisma.order.aggregate({
      where: { 
        tagihanPaylater: { anggotaId }
      },
      _sum: { totalHarga: true }
    });
    const totalTransaksiAnggota = (pinjamanAnggota._sum.nominal || 0) + (orderAnggota._sum.totalHarga || 0);

    const pinjamanSemua = await prisma.pinjaman.aggregate({
      where: { status: 'DICAIRKAN' },
      _sum: { nominal: true }
    });
    const orderSemua = await prisma.order.aggregate({
      _sum: { totalHarga: true }
    });
    const totalTransaksiKoperasi = (pinjamanSemua._sum.nominal || 0) + (orderSemua._sum.totalHarga || 0) || 1;

    const bagianJasaAnggota = (totalTransaksiAnggota / totalTransaksiKoperasi) * (totalShuBerjalan * porsiJasaAnggota);

    // 4. Total Estimasi SHU
    const estimasiShu = bagianJasaModal + bagianJasaAnggota;

    res.json({
      anggotaId,
      totalShuKoperasi: totalShuBerjalan,
      bagianJasaModal,
      bagianJasaAnggota,
      estimasiTotalShu: estimasiShu
    });
  } catch (error) {
    console.error('Error kalkulasi estimasi SHU:', error);
    res.status(500).json({ error: 'Gagal mengkalkulasi estimasi SHU' });
  }
});

// GET Simulasi SHU Global (Untuk Admin Dashboard)
router.get('/simulasi', async (req: Request, res: Response): Promise<any> => {
  try {
    const currentYear = new Date().getFullYear();
    const startDate = new Date(`${currentYear}-01-01`);
    const endDate = new Date(`${currentYear}-12-31`);

    // A. Pemasukan Pinjaman
    const angsuranLunas = await prisma.angsuran.aggregate({
      where: { status: 'LUNAS', tanggalBayar: { gte: startDate, lte: endDate } },
      _sum: { nominalBunga: true, dendaKeterlambatan: true }
    });
    const pendapatanBunga = (angsuranLunas._sum.nominalBunga || 0) + (angsuranLunas._sum.dendaKeterlambatan || 0);

    // B. Pemasukan Biaya
    const pinjamanCair = await prisma.pinjaman.aggregate({
      where: { status: 'DICAIRKAN', tanggalCair: { gte: startDate, lte: endDate } },
      _sum: { biayaAdmin: true, biayaAsuransi: true }
    });
    const pendapatanBiayaPinjaman = (pinjamanCair._sum.biayaAdmin || 0) + (pinjamanCair._sum.biayaAsuransi || 0);

    // C. Pemasukan Toko
    const orderSelesai = await prisma.orderItem.findMany({
      where: { order: { status: 'SELESAI', createdAt: { gte: startDate, lte: endDate } } },
      include: { produk: true }
    });
    const pendapatanToko = orderSelesai.reduce((acc, item) => acc + ((item.hargaSatuan - item.produk.hargaModal) * item.jumlah), 0);

    // D. Pengaturan
    const setOperasional = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'BIAYA_OPERASIONAL_TAHUNAN' } });
    const biayaOperasional = setOperasional ? parseFloat(setOperasional.nilai) : 0;
    
    const setPersenShu = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'PERSENTASE_SHU_DIBAGIKAN' } });
    const persenShuDibagikan = setPersenShu ? parseFloat(setPersenShu.nilai) : 80; 

    const totalLabaBersih = pendapatanBunga + pendapatanBiayaPinjaman + pendapatanToko - biayaOperasional;
    const totalShuBerjalan = totalLabaBersih > 0 ? totalLabaBersih * (persenShuDibagikan / 100) : 0;

    // Total metrics Koperasi
    const anggotaAktif = await prisma.anggota.count({ where: { status: 'AKTIF' } });
    const semuaSimpanan = await prisma.simpanan.aggregate({ _sum: { saldo: true } });
    const totalSimpananKoperasi = semuaSimpanan._sum.saldo || 1; 

    const pinjamanSemua = await prisma.pinjaman.aggregate({ where: { status: 'DICAIRKAN' }, _sum: { nominal: true } });
    const orderSemua = await prisma.order.aggregate({ _sum: { totalHarga: true } });
    const totalTransaksiKoperasi = (pinjamanSemua._sum.nominal || 0) + (orderSemua._sum.totalHarga || 0) || 1;

    // Hitung per anggota (Top 50 untuk simulasi UI agar tidak berat)
    const anggotaList = await prisma.anggota.findMany({ where: { status: 'AKTIF' }, take: 50 });
    
    const porsiJasaModal = 0.4;
    const porsiJasaAnggota = 0.6;
    
    const simulasiAnggota = await Promise.all(anggotaList.map(async (agt) => {
      // Jasa Modal
      const simpanan = await prisma.simpanan.findMany({ where: { anggotaId: agt.id } });
      const saldo = simpanan.reduce((a, c) => a + c.saldo, 0);
      const jm = (saldo / totalSimpananKoperasi) * (totalShuBerjalan * porsiJasaModal);

      // Jasa Anggota
      const pinj = await prisma.pinjaman.aggregate({ where: { anggotaId: agt.id, status: 'DICAIRKAN' }, _sum: { nominal: true } });
      const ord = await prisma.order.aggregate({ where: { tagihanPaylater: { anggotaId: agt.id } }, _sum: { totalHarga: true } });
      const trx = (pinj._sum.nominal || 0) + (ord._sum.totalHarga || 0);
      const ja = (trx / totalTransaksiKoperasi) * (totalShuBerjalan * porsiJasaAnggota);

      return {
        id: agt.id,
        nama: agt.namaLengkap,
        poinSimpanan: saldo,
        poinTransaksi: trx,
        estimasiShu: jm + ja
      };
    }));

    res.json({
      totalLabaBersih,
      persenShuDibagikan,
      anggotaAktif,
      simulasi: simulasiAnggota
    });
  } catch (error) {
    console.error('Error global simulasi SHU:', error);
    res.status(500).json({ error: 'Gagal mengkalkulasi simulasi SHU global' });
  }
});
router.post('/distribusi', async (req: Request, res: Response): Promise<any> => {
  try {
    const { tahun, totalSHUKotor, persenCadangan, persenPengurus, persenPendidikan, persenJasaModal, persenJasaAnggota } = req.body;
    
    const distribusi = await prisma.$transaction(async (tx) => {
      // 1. Buat Periode SHU
      const periode = await tx.periodeSHU.create({
        data: {
          tahun,
          totalSHUKotor: parseFloat(totalSHUKotor),
          persenCadangan: parseFloat(persenCadangan || 0),
          persenPengurus: parseFloat(persenPengurus || 0),
          persenPendidikan: parseFloat(persenPendidikan || 0),
          persenJasaModal: parseFloat(persenJasaModal),
          persenJasaAnggota: parseFloat(persenJasaAnggota)
        }
      });

      // 2. Kalkulasi porsi untuk setiap anggota dan bagikan secara otomatis sebagai Simpanan Sukarela
      const anggotaList = await tx.anggota.findMany({ where: { status: 'AKTIF' } });
      const semuaSimpanan = await tx.simpanan.aggregate({ _sum: { saldo: true } });
      const totalSimpanan = semuaSimpanan._sum.saldo || 1;
      
      const pinjamanSemua = await tx.pinjaman.aggregate({ where: { status: 'DICAIRKAN' }, _sum: { nominal: true } });
      const orderSemua = await tx.order.aggregate({ _sum: { totalHarga: true } });
      const totalTransaksi = (pinjamanSemua._sum.nominal || 0) + (orderSemua._sum.totalHarga || 0) || 1;

      for (const agt of anggotaList) {
        // Hitung Jasa Modal
        const simp = await tx.simpanan.findMany({ where: { anggotaId: agt.id } });
        const simpAnggota = simp.reduce((a, c) => a + c.saldo, 0);
        const jm = (simpAnggota / totalSimpanan) * periode.totalSHUKotor * (periode.persenJasaModal / 100);

        // Hitung Jasa Anggota
        const pinj = await tx.pinjaman.aggregate({ where: { anggotaId: agt.id, status: 'DICAIRKAN' }, _sum: { nominal: true } });
        const ord = await tx.order.aggregate({ where: { tagihanPaylater: { anggotaId: agt.id } }, _sum: { totalHarga: true } });
        const trxAnggota = (pinj._sum.nominal || 0) + (ord._sum.totalHarga || 0);
        const ja = (trxAnggota / totalTransaksi) * periode.totalSHUKotor * (periode.persenJasaAnggota / 100);

        const totalDidapat = jm + ja;

        if (totalDidapat > 0) {
          // Buat riwayat SHU
          await tx.riwayatSHU.create({
            data: {
              periodeId: periode.id,
              anggotaId: agt.id,
              nominalJasaModal: jm,
              nominalJasaAnggota: ja,
              totalSHU: totalDidapat,
              statusPencairan: 'DITAHAN_DI_SIMPANAN'
            }
          });

          // Masukkan ke Simpanan Sukarela
          let sukarela = await tx.simpanan.findFirst({ where: { anggotaId: agt.id, jenisSimpanan: 'SUKARELA' } });
          if (!sukarela) {
            sukarela = await tx.simpanan.create({
              data: { anggotaId: agt.id, jenisSimpanan: 'SUKARELA', saldo: 0 }
            });
          }
          await tx.simpanan.update({
            where: { id: sukarela.id },
            data: { saldo: sukarela.saldo + totalDidapat }
          });
        }
      }
      return periode;
    });

    res.json({ message: 'Distribusi SHU berhasil', data: distribusi });
  } catch (error) {
    console.error('Error distribusi SHU:', error);
    res.status(500).json({ error: 'Gagal melakukan distribusi SHU' });
  }
});

export default router;
