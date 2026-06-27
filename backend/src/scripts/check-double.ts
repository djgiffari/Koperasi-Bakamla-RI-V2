import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function checkDouble() {
  const simpanan = await prisma.simpanan.aggregate({
    _sum: { saldo: true }
  });
  
  const mutasi = await prisma.mutasiSimpanan.aggregate({
    _sum: { nominal: true }
  });

  const mutasiWajib = await prisma.mutasiSimpanan.aggregate({
    where: { jenisSimpanan: 'WAJIB' },
    _sum: { nominal: true }
  });

  const simpananWajib = await prisma.simpanan.aggregate({
    where: { jenisSimpanan: 'WAJIB' },
    _sum: { saldo: true }
  });

  const allWajib = await prisma.simpanan.findMany({
    where: { jenisSimpanan: 'WAJIB' }
  });
  const allMutasi = await prisma.mutasiSimpanan.findMany({
    where: { jenisSimpanan: 'WAJIB' }
  });

  console.log('Total Simpanan Saldo:', simpanan._sum.saldo);
  console.log('Total Mutasi Nominal:', mutasi._sum.nominal);
  console.log('Total Simpanan Wajib Saldo:', simpananWajib._sum.saldo);
  console.log('Total Mutasi Wajib Nominal:', mutasiWajib._sum.nominal);
  console.log('Count Simpanan Wajib rows:', allWajib.length);
  console.log('Count Mutasi Wajib rows:', allMutasi.length);
}

checkDouble().then(() => prisma.$disconnect()).catch(e => { console.error(e); prisma.$disconnect(); });
