import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET Estimasi SHU untuk seorang Anggota (dipanggil oleh Mobile Dashboard)
router.get('/estimasi/:anggotaId', async (req: Request, res: Response): Promise<any> => {
  try {
    const anggotaId = parseInt(req.params.anggotaId as string);
    
    // 1. Ambil Total Kas / Laba Koperasi saat ini (Sederhananya: Saldo KasKoperasi - Total Simpanan Pokok & Wajib)
    const kas = await prisma.kasKoperasi.findFirst();
    const totalShuBerjalan = kas ? kas.saldo * 0.2 : 0; // Simulasi 20% Kas adalah SHU Koperasi

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

// POST Distribusi SHU Tahunan (Oleh Pengawas / Ketua)
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
