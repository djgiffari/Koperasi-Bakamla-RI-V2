import { PrismaClient, StatusAnggota, JenisSimpanan, StatusPinjaman, Kolektibilitas, StatusAngsuran, SkemaBunga } from '@prisma/client';
import * as xlsx from 'xlsx';
import bcrypt from 'bcrypt';

const prisma = new PrismaClient();
const FILE_PATH = 'C:\\Users\\Giffari\\Downloads\\REKAP PENARIKAN SPSW 2024 edit.xlsx';
const DEFAULT_PASSWORD = '123456';
const PINJAMAN_BUNGA_PERSEN = 1.0; 

function excelDateToJSDate(serial: any): Date | null {
  if (typeof serial === 'number') {
    const utc_days = Math.floor(serial - 25569);
    const utc_value = utc_days * 86400;
    return new Date(utc_value * 1000);
  }
  return null;
}

function safeStr(val: any): string {
  if (val === undefined || val === null) return '';
  return String(val).trim();
}

function safeDate(val: any): Date | undefined {
  if (typeof val === 'number') {
    return excelDateToJSDate(val) || undefined;
  }
  return undefined;
}

async function migrate() {
  console.log('Starting Migration from Excel to DB...');
  const workbook = xlsx.readFile(FILE_PATH);
  const hashedPassword = await bcrypt.hash(DEFAULT_PASSWORD, 10);
  
  // WIPE DATA to ensure exact count (since we are replacing all)
  await prisma.angsuran.deleteMany();
  await prisma.pinjaman.deleteMany();
  await prisma.simpanan.deleteMany();
  await prisma.anggota.deleteMany();
  
  const sheet1Name = 'SPSW BULANAN';
  const sheet1 = workbook.Sheets[sheet1Name];
  const data1: any[][] = xlsx.utils.sheet_to_json(sheet1, { header: 1 });
  
  const createdAnggotaMap = new Map(); // to map original names to IDs for loans

  console.log('--- Migrating Anggota & Simpanan ---');
  let validCount = 0;
  for (let i = 2; i < data1.length; i++) {
    const row = data1[i];
    if (!row || row.length === 0 || row[0] === undefined || row[0] === null || typeof row[0] !== 'number') continue;
    
    const nama = safeStr(row[1]);
    if (!nama) continue;
    
    let nip = safeStr(row[4]);
    if (!nip) nip = `NIP-${Date.now()}-${i}`;
    
    // Check if NIP is taken in this loop to avoid @unique constraint error
    const checkNip = await prisma.anggota.findFirst({ where: { nip } });
    if (checkNip) {
       nip = `${nip}-DUP-${i}`;
    }

    validCount++;

    const anggota = await prisma.anggota.create({
      data: {
        nip: nip,
        namaLengkap: nama,
        tempatLahir: safeStr(row[2]),
        tanggalLahir: safeDate(row[3]),
        pangkat: safeStr(row[5]),
        unitKerja: safeStr(row[6]),
        alamatKantor: safeStr(row[7]),
        noKtp: safeStr(row[8]),
        alamatRumah: safeStr(row[9]),
        noHp: safeStr(row[10]),
        noRekening: safeStr(row[11]),
        fcSkStatus: safeStr(row[12]) || 'belum',
        password: hashedPassword,
        status: StatusAnggota.AKTIF,
      }
    });
    
    createdAnggotaMap.set(nama, anggota.id); // store ID for loans
    
    const simpananPokok = Number(row[13]) || 0;
    let simpananWajib = 0;
    for (let col = 14; col <= 25; col++) {
      simpananWajib += Number(row[col]) || 0;
    }
    const totalSHU = Number(row[26]) || 0;
    
    await prisma.simpanan.create({ data: { anggotaId: anggota.id, jenisSimpanan: JenisSimpanan.POKOK, saldo: simpananPokok } });
    await prisma.simpanan.create({ data: { anggotaId: anggota.id, jenisSimpanan: JenisSimpanan.WAJIB, saldo: simpananWajib } });
    
    if (simpananPokok > 0) {
      await prisma.mutasiSimpanan.create({
        data: {
          anggotaId: anggota.id,
          jenisSimpanan: JenisSimpanan.POKOK,
          jenisMutasi: 'SETORAN',
          nominal: simpananPokok,
          keterangan: 'Migrasi Awal (Excel)',
          status: 'DISETUJUI',
          isDivalidasiBank: true
        }
      });
    }

    if (simpananWajib > 0) {
      await prisma.mutasiSimpanan.create({
        data: {
          anggotaId: anggota.id,
          jenisSimpanan: JenisSimpanan.WAJIB,
          jenisMutasi: 'SETORAN',
          nominal: simpananWajib,
          keterangan: 'Migrasi Awal (Excel)',
          status: 'DISETUJUI',
          isDivalidasiBank: true
        }
      });
    }
    
    // We don't insert totalSHU as SUKARELA because it's just the sum of Pokok and Wajib (SPSW).
  }
  
  console.log(`Created ${validCount} Anggota!`);

  const sheet2Name = 'PINJAMAN';
  const sheet2 = workbook.Sheets[sheet2Name];
  const data2: any[][] = xlsx.utils.sheet_to_json(sheet2, { header: 1 });
  
  console.log('\\n--- Migrating Pinjaman ---');
  for (let i = 1; i < data2.length; i++) {
    const row = data2[i];
    if (!row || row.length === 0 || typeof row[0] !== 'number') continue;
    
    const nama = safeStr(row[1]);
    const nominalPinjaman = Number(row[13]) || 0;
    let tenor = parseInt(safeStr(row[14])) || 12; 
    const potongan1 = Number(row[15]) || 0;
    
    if (!nama || nominalPinjaman === 0) continue;
    
    const anggotaId = createdAnggotaMap.get(nama);
    if (!anggotaId) {
      console.log(`[WARNING] Anggota not found for loan: ${nama}`);
      continue;
    }
    
    const pinjaman = await prisma.pinjaman.create({
      data: {
        anggotaId: anggotaId,
        nominal: nominalPinjaman,
        tenor: tenor,
        status: StatusPinjaman.DICAIRKAN,
        kolektibilitas: Kolektibilitas.LANCAR,
        skemaBunga: SkemaBunga.FLAT,
        bungaPersen: PINJAMAN_BUNGA_PERSEN, 
        nominalCair: nominalPinjaman, 
        tanggalCair: new Date('2024-08-01') 
      }
    });
    
    if (potongan1 > 0) {
      await prisma.angsuran.create({
        data: {
          pinjamanId: pinjaman.id,
          bulanKe: 1,
          nominalPokok: nominalPinjaman / tenor, 
          nominalBunga: potongan1 - (nominalPinjaman / tenor), 
          totalTagihan: potongan1,
          jatuhTempo: new Date('2024-09-03'), 
          status: StatusAngsuran.LUNAS,
          isDivalidasiBank: true,
          tanggalBayar: new Date('2024-09-03')
        }
      });
    }
    
    let currentJatuhTempo = new Date('2024-10-03');
    for (let b = 2; b <= tenor; b++) {
      await prisma.angsuran.create({
        data: {
          pinjamanId: pinjaman.id,
          bulanKe: b,
          nominalPokok: nominalPinjaman / tenor,
          nominalBunga: potongan1 - (nominalPinjaman / tenor),
          totalTagihan: potongan1, 
          jatuhTempo: currentJatuhTempo,
          status: StatusAngsuran.BELUM_BAYAR
        }
      });
      currentJatuhTempo = new Date(currentJatuhTempo);
      currentJatuhTempo.setMonth(currentJatuhTempo.getMonth() + 1);
    }
  }
  
  console.log('Migration Completed Successfully!');
}

migrate()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
