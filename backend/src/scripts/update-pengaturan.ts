import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function main() {
  await prisma.pengaturanUmum.deleteMany({ where: { kategori: 'JENIS_SIMPANAN' } });
  await prisma.pengaturanUmum.createMany({
    data: [
      { kategori: 'JENIS_SIMPANAN', nilai: 'POKOK' },
      { kategori: 'JENIS_SIMPANAN', nilai: 'WAJIB' },
      { kategori: 'JENIS_SIMPANAN', nilai: 'SUKARELA' }
    ]
  });
  console.log('Updated PengaturanUmum');
}

main().then(() => prisma.$disconnect());
