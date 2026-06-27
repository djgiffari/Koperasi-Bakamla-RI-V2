import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function fixPinjamanDates() {
  console.log('Fixing Pinjaman & Angsuran dates...');
  
  // Set Pinjaman createdAt to August 1, 2024
  const updatedPinjaman = await prisma.pinjaman.updateMany({
    data: {
      createdAt: new Date('2024-08-01T08:00:00Z'),
      updatedAt: new Date('2024-08-01T08:00:00Z')
    }
  });
  
  // Set Angsuran createdAt to Sept 3, 2024
  const updatedAngsuran = await prisma.angsuran.updateMany({
    data: {
      createdAt: new Date('2024-09-03T08:00:00Z'),
      updatedAt: new Date('2024-09-03T08:00:00Z')
    }
  });

  console.log(`Updated ${updatedPinjaman.count} pinjaman`);
  console.log(`Updated ${updatedAngsuran.count} angsuran`);
}

fixPinjamanDates().then(() => prisma.$disconnect()).catch(e => { console.error(e); prisma.$disconnect(); });
