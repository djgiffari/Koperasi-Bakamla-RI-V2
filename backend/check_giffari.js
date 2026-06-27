const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  const anggota = await prisma.anggota.findMany({
    where: { namaLengkap: { contains: 'Giffari', mode: 'insensitive' } },
    include: { simpanan: true, mutasiSimpanan: true }
  });
  console.log(JSON.stringify(anggota, null, 2));
}

main().catch(console.error).finally(() => prisma.$disconnect());
