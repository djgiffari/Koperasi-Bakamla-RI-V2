const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  await prisma.mutasiSimpanan.create({
    data: {
      anggotaId: 2157,
      jenisSimpanan: 'WAJIB',
      jenisMutasi: 'SETORAN',
      nominal: 175000,
      keterangan: 'Migrasi Awal Simpanan Wajib',
      status: 'DISETUJUI',
      isDivalidasiBank: true
    }
  });
  console.log('Mutasi berhasil disisipkan untuk Giffari!');
}

main().catch(console.error).finally(() => prisma.$disconnect());
