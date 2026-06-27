import cron from 'node-cron';
import prisma from './prisma';

// 1. Cron Job: Denda Keterlambatan Harian (Berjalan setiap jam 00:01)
cron.schedule('1 0 * * *', async () => {
  console.log('[Cron] Menjalankan pengecekan denda keterlambatan...');
  try {
    const hariIni = new Date();
    
    // Cari angsuran yang belum lunas dan sudah lewat jatuh tempo
    const angsuranTelat = await prisma.angsuran.findMany({
      where: {
        status: 'BELUM_BAYAR',
        jatuhTempo: {
          lt: hariIni // Jatuh tempo sebelum hari ini
        }
      },
      include: { pinjaman: true }
    });

    const setDenda = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'DENDA_KETERLAMBATAN_PER_HARI' } });
    const persenDendaHarian = setDenda ? parseFloat(setDenda.nilai) : 0.5; // default 0.5% per hari telat

    for (const angsuran of angsuranTelat) {
      // Hitung selisih hari
      const diffTime = Math.abs(hariIni.getTime() - angsuran.jatuhTempo.getTime());
      const selisihHari = Math.floor(diffTime / (1000 * 60 * 60 * 24));

      if (selisihHari > 0) {
        const totalDenda = angsuran.nominalPokok * (persenDendaHarian / 100) * selisihHari;
        const totalTagihanBaru = angsuran.nominalPokok + angsuran.nominalBunga + totalDenda;

        await prisma.angsuran.update({
          where: { id: angsuran.id },
          data: {
            dendaKeterlambatan: totalDenda,
            totalTagihan: totalTagihanBaru
          }
        });
      }
    }
    console.log(`[Cron] Selesai memproses ${angsuranTelat.length} tagihan telat.`);
  } catch (error) {
    console.error('[Cron Error] Gagal menghitung denda:', error);
  }
});

// 2. Cron Job: Generate Tagihan Simpanan Wajib (Berjalan setiap tanggal 1 jam 00:05)
cron.schedule('5 0 1 * *', async () => {
  console.log('[Cron] Generate Tagihan Simpanan Wajib Bulanan...');
  try {
    const anggotaAktif = await prisma.anggota.findMany({
      where: { status: 'AKTIF' }
    });

    // Asumsi nominal simpanan wajib ada di pengaturan, atau default Rp 100.000
    const setWajib = await prisma.pengaturanUmum.findFirst({ where: { kategori: 'NOMINAL_SIMPANAN_WAJIB' } });
    const nominalWajib = setWajib ? parseFloat(setWajib.nilai) : 100000;

    for (const anggota of anggotaAktif) {
      await prisma.mutasiSimpanan.create({
        data: {
          anggotaId: anggota.id,
          jenisSimpanan: 'WAJIB',
          jenisMutasi: 'SETORAN',
          nominal: nominalWajib,
          keterangan: `Tagihan Simpanan Wajib - Bulan ${new Date().getMonth() + 1}`,
          status: 'MENUNGGU_VERIFIKASI' // Belum disetujui / belum dibayar riil
        }
      });
    }
    console.log(`[Cron] Selesai meng-generate tagihan simpanan wajib untuk ${anggotaAktif.length} anggota.`);
  } catch (error) {
    console.error('[Cron Error] Gagal meng-generate tagihan simpanan wajib:', error);
  }
});

export const startScheduler = () => {
  console.log('[Scheduler] Cron Jobs initialized.');
};
