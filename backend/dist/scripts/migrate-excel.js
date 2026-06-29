"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const xlsx = __importStar(require("xlsx"));
const bcrypt_1 = __importDefault(require("bcrypt"));
const prisma = new client_1.PrismaClient();
const FILE_PATH = 'C:\\Users\\Giffari\\Downloads\\REKAP PENARIKAN SPSW 2024 edit.xlsx';
const DEFAULT_PASSWORD = '123456';
const PINJAMAN_BUNGA_PERSEN = 1.0;
function excelDateToJSDate(serial) {
    if (typeof serial === 'number') {
        const utc_days = Math.floor(serial - 25569);
        const utc_value = utc_days * 86400;
        return new Date(utc_value * 1000);
    }
    return null;
}
function safeStr(val) {
    if (val === undefined || val === null)
        return '';
    return String(val).trim();
}
function safeDate(val) {
    if (typeof val === 'number') {
        return excelDateToJSDate(val) || undefined;
    }
    return undefined;
}
function migrate() {
    return __awaiter(this, void 0, void 0, function* () {
        console.log('Starting Migration from Excel to DB...');
        const workbook = xlsx.readFile(FILE_PATH);
        const hashedPassword = yield bcrypt_1.default.hash(DEFAULT_PASSWORD, 10);
        // WIPE DATA to ensure exact count (since we are replacing all)
        yield prisma.angsuran.deleteMany();
        yield prisma.pinjaman.deleteMany();
        yield prisma.simpanan.deleteMany();
        yield prisma.anggota.deleteMany();
        const sheet1Name = 'SPSW BULANAN';
        const sheet1 = workbook.Sheets[sheet1Name];
        const data1 = xlsx.utils.sheet_to_json(sheet1, { header: 1 });
        const createdAnggotaMap = new Map(); // to map original names to IDs for loans
        console.log('--- Migrating Anggota & Simpanan ---');
        let validCount = 0;
        for (let i = 2; i < data1.length; i++) {
            const row = data1[i];
            if (!row || row.length === 0 || row[0] === undefined || row[0] === null || typeof row[0] !== 'number')
                continue;
            const nama = safeStr(row[1]);
            if (!nama)
                continue;
            let nip = safeStr(row[4]);
            if (!nip)
                nip = `NIP-${Date.now()}-${i}`;
            // Check if NIP is taken in this loop to avoid @unique constraint error
            const checkNip = yield prisma.anggota.findFirst({ where: { nip } });
            if (checkNip) {
                nip = `${nip}-DUP-${i}`;
            }
            validCount++;
            const anggota = yield prisma.anggota.create({
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
                    status: client_1.StatusAnggota.AKTIF,
                }
            });
            createdAnggotaMap.set(nama, anggota.id); // store ID for loans
            const simpananPokok = Number(row[13]) || 0;
            let simpananWajib = 0;
            for (let col = 14; col <= 25; col++) {
                simpananWajib += Number(row[col]) || 0;
            }
            const totalSHU = Number(row[26]) || 0;
            yield prisma.simpanan.create({ data: { anggotaId: anggota.id, jenisSimpanan: client_1.JenisSimpanan.POKOK, saldo: simpananPokok } });
            yield prisma.simpanan.create({ data: { anggotaId: anggota.id, jenisSimpanan: client_1.JenisSimpanan.WAJIB, saldo: simpananWajib } });
            if (simpananPokok > 0) {
                yield prisma.mutasiSimpanan.create({
                    data: {
                        anggotaId: anggota.id,
                        jenisSimpanan: client_1.JenisSimpanan.POKOK,
                        jenisMutasi: 'SETORAN',
                        nominal: simpananPokok,
                        keterangan: 'Migrasi Awal (Excel)',
                        status: 'DISETUJUI',
                        isDivalidasiBank: true
                    }
                });
            }
            if (simpananWajib > 0) {
                yield prisma.mutasiSimpanan.create({
                    data: {
                        anggotaId: anggota.id,
                        jenisSimpanan: client_1.JenisSimpanan.WAJIB,
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
        const data2 = xlsx.utils.sheet_to_json(sheet2, { header: 1 });
        console.log('\\n--- Migrating Pinjaman ---');
        for (let i = 1; i < data2.length; i++) {
            const row = data2[i];
            if (!row || row.length === 0 || typeof row[0] !== 'number')
                continue;
            const nama = safeStr(row[1]);
            const nominalPinjaman = Number(row[13]) || 0;
            let tenor = parseInt(safeStr(row[14])) || 12;
            const potongan1 = Number(row[15]) || 0;
            if (!nama || nominalPinjaman === 0)
                continue;
            const anggotaId = createdAnggotaMap.get(nama);
            if (!anggotaId) {
                console.log(`[WARNING] Anggota not found for loan: ${nama}`);
                continue;
            }
            const pinjaman = yield prisma.pinjaman.create({
                data: {
                    anggotaId: anggotaId,
                    nominal: nominalPinjaman,
                    tenor: tenor,
                    status: client_1.StatusPinjaman.DICAIRKAN,
                    kolektibilitas: client_1.Kolektibilitas.LANCAR,
                    skemaBunga: client_1.SkemaBunga.FLAT,
                    bungaPersen: PINJAMAN_BUNGA_PERSEN,
                    nominalCair: nominalPinjaman,
                    tanggalCair: new Date('2024-08-01')
                }
            });
            if (potongan1 > 0) {
                yield prisma.angsuran.create({
                    data: {
                        pinjamanId: pinjaman.id,
                        bulanKe: 1,
                        nominalPokok: nominalPinjaman / tenor,
                        nominalBunga: potongan1 - (nominalPinjaman / tenor),
                        totalTagihan: potongan1,
                        jatuhTempo: new Date('2024-09-03'),
                        status: client_1.StatusAngsuran.LUNAS,
                        isDivalidasiBank: true,
                        tanggalBayar: new Date('2024-09-03')
                    }
                });
            }
            let currentJatuhTempo = new Date('2024-10-03');
            for (let b = 2; b <= tenor; b++) {
                yield prisma.angsuran.create({
                    data: {
                        pinjamanId: pinjaman.id,
                        bulanKe: b,
                        nominalPokok: nominalPinjaman / tenor,
                        nominalBunga: potongan1 - (nominalPinjaman / tenor),
                        totalTagihan: potongan1,
                        jatuhTempo: currentJatuhTempo,
                        status: client_1.StatusAngsuran.BELUM_BAYAR
                    }
                });
                currentJatuhTempo = new Date(currentJatuhTempo);
                currentJatuhTempo.setMonth(currentJatuhTempo.getMonth() + 1);
            }
        }
        console.log('Migration Completed Successfully!');
    });
}
migrate()
    .catch((e) => {
    console.error(e);
    process.exit(1);
})
    .finally(() => __awaiter(void 0, void 0, void 0, function* () {
    yield prisma.$disconnect();
}));
