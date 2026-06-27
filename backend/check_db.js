const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  const simpanan = await prisma.simpanan.findMany();
  console.log('Simpanan:', simpanan);
  
  const mutasi = await prisma.mutasiSimpanan.findMany();
  console.log('MutasiSimpanan:', mutasi);
}

main().catch(console.error).finally(() => prisma.$disconnect());
