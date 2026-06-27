import { PrismaClient, JenisSimpanan } from '@prisma/client';
import * as xlsx from 'xlsx';

const prisma = new PrismaClient();
const FILE_PATH = 'C:\\Users\\Giffari\\Downloads\\REKAP PENARIKAN SPSW 2024 edit.xlsx';

function safeStr(val: any): string {
  if (val === undefined || val === null) return '';
  return String(val).trim();
}

async function fixSimpanan() {
  console.log('Starting Fix Mutasi Simpanan Dates...');
  const workbook = xlsx.readFile(FILE_PATH);
  
  // Hapus semua MutasiSimpanan migrasi awal
  const deleted = await prisma.mutasiSimpanan.deleteMany({
    where: { keterangan: 'Migrasi Awal (Excel)' }
  });
  console.log(`Deleted ${deleted.count} old mutasi simpanan records.`);

  const sheet1Name = 'SPSW BULANAN';
  const sheet1 = workbook.Sheets[sheet1Name];
  const data1: any[][] = xlsx.utils.sheet_to_json(sheet1, { header: 1 });
  
  const getMonthDate = (col: number) => {
    // col 14 is June 2024. col 15 is July 2024, etc.
    const diff = col - 14;
    const d = new Date('2024-06-01T08:00:00Z');
    d.setMonth(d.getMonth() + diff);
    return d;
  };

  let insertedCount = 0;

  for (let i = 2; i < data1.length; i++) {
    const row = data1[i];
    if (!row || row.length === 0 || typeof row[0] !== 'number') continue;
    
    const nama = safeStr(row[1]);
    if (!nama) continue;
    
    // Find Anggota in DB
    const anggota = await prisma.anggota.findFirst({
      where: { namaLengkap: nama }
    });

    if (!anggota) {
      console.log(`Anggota not found: ${nama}`);
      continue;
    }

    const simpananPokok = Number(row[13]) || 0;
    if (simpananPokok > 0) {
      await prisma.mutasiSimpanan.create({
        data: {
          anggotaId: anggota.id,
          jenisSimpanan: JenisSimpanan.POKOK,
          jenisMutasi: 'SETORAN',
          nominal: simpananPokok,
          keterangan: 'Migrasi Awal (Excel)',
          status: 'DISETUJUI',
          isDivalidasiBank: true,
          createdAt: new Date('2024-06-01T08:00:00Z')
        }
      });
      insertedCount++;
    }

    for (let col = 14; col <= 25; col++) {
      const val = Number(row[col]) || 0;
      if (val > 0) {
        await prisma.mutasiSimpanan.create({
          data: {
            anggotaId: anggota.id,
            jenisSimpanan: JenisSimpanan.WAJIB,
            jenisMutasi: 'SETORAN',
            nominal: val,
            keterangan: 'Migrasi Awal (Excel)',
            status: 'DISETUJUI',
            isDivalidasiBank: true,
            createdAt: getMonthDate(col)
          }
        });
        insertedCount++;
      }
    }
  }
  
  console.log(`Inserted ${insertedCount} new mutasi simpanan records with correct dates!`);
}

fixSimpanan().then(() => prisma.$disconnect()).catch(e => { console.error(e); prisma.$disconnect(); });
