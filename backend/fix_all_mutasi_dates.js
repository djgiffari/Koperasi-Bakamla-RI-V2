const xlsx = require('xlsx');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const FILE_PATH = 'C:\\Users\\Giffari\\Downloads\\DATA ANGGOTA dan PINJAMAN.xlsx';

async function main() {
  console.log('Reading Excel file...');
  const workbook = xlsx.readFile(FILE_PATH);
  const sheet = workbook.Sheets[workbook.SheetNames[0]];
  const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });

  // Columns:
  // 13: Simpanan Pokok
  // 14: Juni 2024
  // 15: Juli 2024
  // 16: Agustus 2024
  // 17: September 2024
  // 18: Oktober 2024
  // 19: November 2024
  // 20: Desember 2024
  // 21: Februari 2025

  const monthDates = {
    14: new Date(2024, 5, 1, 8, 0, 0),   // Juni
    15: new Date(2024, 6, 1, 8, 0, 0),   // Juli
    16: new Date(2024, 7, 1, 8, 0, 0),   // Agustus
    17: new Date(2024, 8, 1, 8, 0, 0),   // September
    18: new Date(2024, 9, 1, 8, 0, 0),   // Oktober
    19: new Date(2024, 10, 1, 8, 0, 0),  // November
    20: new Date(2024, 11, 1, 8, 0, 0),  // Desember
    21: new Date(2025, 1, 1, 8, 0, 0),   // Februari 2025
  };

  // We will delete all MutasiSimpanan for ALL members, but we only have members from Excel.
  // Actually, to be safe, we will just delete all MutasiSimpanan in the DB and recreate them.
  await prisma.mutasiSimpanan.deleteMany({});
  
  // Also we must recount Simpanan Wajib and Pokok total balances just to be absolutely sure.
  await prisma.simpanan.updateMany({
    data: { saldo: 0 }
  });

  const records = [];
  const anggotaMap = new Map();

  // Load all anggota by NIP and by Nama to map them
  const allAnggota = await prisma.anggota.findMany();
  for (const a of allAnggota) {
    if (a.nip) anggotaMap.set(a.nip, a.id);
    anggotaMap.set(a.namaLengkap.trim().toLowerCase(), a.id);
  }

  for (let i = 1; i < data.length; i++) {
    const row = data[i];
    if (!row || row.length === 0 || !row[1]) continue;

    const nip = String(row[4] || '').trim();
    const nama = String(row[1] || '').trim().toLowerCase();
    
    let anggotaId = anggotaMap.get(nip);
    if (!anggotaId) anggotaId = anggotaMap.get(nama);

    if (!anggotaId) {
      // console.log(`Skipping row ${i}, NIP: ${nip}, Nama: ${nama} (Not found in DB)`);
      continue;
    }

    let totalPokok = 0;
    let totalWajib = 0;

    // Simpanan Pokok
    const pokok = Number(row[13]);
    if (pokok > 0) {
      records.push({
        anggotaId: anggotaId,
        jenisSimpanan: 'POKOK',
        jenisMutasi: 'SETORAN',
        nominal: pokok,
        keterangan: 'Simpanan Pokok',
        status: 'DISETUJUI',
        isDivalidasiBank: true,
        createdAt: new Date(2024, 4, 1, 8, 0, 0), // Mei 2024 for Pokok
        updatedAt: new Date(2024, 4, 1, 8, 0, 0)
      });
      totalPokok += pokok;
    }

    // Simpanan Wajib
    for (let col = 14; col <= 21; col++) {
      const nominal = Number(row[col]);
      if (nominal > 0) {
        const date = monthDates[col];
        records.push({
          anggotaId: anggotaId,
          jenisSimpanan: 'WAJIB',
          jenisMutasi: 'SETORAN',
          nominal: nominal,
          keterangan: 'Simpanan Wajib Bulanan',
          status: 'DISETUJUI',
          isDivalidasiBank: true,
          createdAt: date,
          updatedAt: date
        });
        totalWajib += nominal;
      }
    }

    // Update the total simpanan balances
    if (totalPokok > 0) {
      const existingPokok = await prisma.simpanan.findFirst({
        where: { anggotaId: anggotaId, jenisSimpanan: 'POKOK' }
      });
      if (existingPokok) {
        await prisma.simpanan.update({
          where: { id: existingPokok.id },
          data: { saldo: totalPokok }
        });
      } else {
        await prisma.simpanan.create({
          data: { anggotaId: anggotaId, jenisSimpanan: 'POKOK', saldo: totalPokok }
        });
      }
    }

    if (totalWajib > 0) {
      const existingWajib = await prisma.simpanan.findFirst({
        where: { anggotaId: anggotaId, jenisSimpanan: 'WAJIB' }
      });
      if (existingWajib) {
        await prisma.simpanan.update({
          where: { id: existingWajib.id },
          data: { saldo: totalWajib }
        });
      } else {
        await prisma.simpanan.create({
          data: { anggotaId: anggotaId, jenisSimpanan: 'WAJIB', saldo: totalWajib }
        });
      }
    }
  }

  console.log(`Inserting ${records.length} MutasiSimpanan records...`);
  
  // Chunk insert to avoid too many variables limit in SQLite if any, or just large payloads
  const chunkSize = 1000;
  for (let i = 0; i < records.length; i += chunkSize) {
    const chunk = records.slice(i, i + chunkSize);
    await prisma.mutasiSimpanan.createMany({ data: chunk });
  }

  console.log('Finished updating dates for all MutasiSimpanan based on Excel!');
}

main().catch(console.error).finally(() => prisma.$disconnect());
