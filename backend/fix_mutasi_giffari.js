const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  // Hapus mutasi 175rb yang barusan dibuat (anggotaId 2157)
  await prisma.mutasiSimpanan.deleteMany({
    where: {
      anggotaId: 2157,
      nominal: 175000
    }
  });

  // Buat 7 record masing-masing 25rb selama 7 bulan ke belakang
  const now = new Date();
  const records = [];
  for (let i = 6; i >= 0; i--) {
    const d = new Date();
    d.setMonth(now.getMonth() - i);
    d.setDate(1); // Set ke tanggal 1 tiap bulannya agar rapi
    d.setHours(8, 0, 0, 0); // Jam 08:00
    
    records.push({
      anggotaId: 2157,
      jenisSimpanan: 'WAJIB',
      jenisMutasi: 'SETORAN',
      nominal: 25000,
      keterangan: 'Simpanan Wajib Bulanan',
      status: 'DISETUJUI',
      isDivalidasiBank: true,
      createdAt: d,
      updatedAt: d
    });
  }

  await prisma.mutasiSimpanan.createMany({
    data: records
  });
  
  console.log('Berhasil memperbaiki riwayat Giffari menjadi pecahan 25.000 per bulan!');
}

main().catch(console.error).finally(() => prisma.$disconnect());
