const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  const anggotaId = 2157; // NIP: 199601202024211004

  // 1. Delete existing MutasiSimpanan WAJIB for this user
  await prisma.mutasiSimpanan.deleteMany({
    where: {
      anggotaId: anggotaId,
      jenisSimpanan: 'WAJIB'
    }
  });

  // 2. Create 7 records from June 2024 to Dec 2024 (7 months)
  const records = [];
  const startYear = 2024;
  const startMonth = 5; // June (0-indexed)
  
  for (let i = 0; i < 7; i++) {
    const d = new Date(startYear, startMonth + i, 1, 8, 0, 0, 0);
    records.push({
      anggotaId: anggotaId,
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

  // 3. Update Simpanan balance to 7 * 25000 = 175000
  await prisma.simpanan.updateMany({
    where: {
      anggotaId: anggotaId,
      jenisSimpanan: 'WAJIB'
    },
    data: {
      saldo: 175000
    }
  });
  
  console.log('Berhasil memperbaiki riwayat NIP 199601202024211004 (Juni 2024 - Des 2024)! Total saldo 175.000');
}

main().catch(console.error).finally(() => prisma.$disconnect());
