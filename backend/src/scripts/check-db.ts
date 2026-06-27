import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function main() {
  const users = await prisma.user.count();
  const anggota = await prisma.anggota.count();
  const simpanan = await prisma.simpanan.count();
  const pinjaman = await prisma.pinjaman.count();
  
  console.log(`Users: ${users}`);
  console.log(`Anggota: ${anggota}`);
  console.log(`Simpanan: ${simpanan}`);
  console.log(`Pinjaman: ${pinjaman}`);
}

main().catch(console.error).then(() => prisma.$disconnect());
