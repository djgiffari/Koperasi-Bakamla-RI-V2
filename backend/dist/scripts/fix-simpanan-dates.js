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
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const xlsx = __importStar(require("xlsx"));
const prisma = new client_1.PrismaClient();
const FILE_PATH = 'C:\\Users\\Giffari\\Downloads\\REKAP PENARIKAN SPSW 2024 edit.xlsx';
function safeStr(val) {
    if (val === undefined || val === null)
        return '';
    return String(val).trim();
}
function fixSimpanan() {
    return __awaiter(this, void 0, void 0, function* () {
        console.log('Starting Fix Mutasi Simpanan Dates...');
        const workbook = xlsx.readFile(FILE_PATH);
        // Hapus semua MutasiSimpanan migrasi awal
        const deleted = yield prisma.mutasiSimpanan.deleteMany({
            where: { keterangan: 'Migrasi Awal (Excel)' }
        });
        console.log(`Deleted ${deleted.count} old mutasi simpanan records.`);
        const sheet1Name = 'SPSW BULANAN';
        const sheet1 = workbook.Sheets[sheet1Name];
        const data1 = xlsx.utils.sheet_to_json(sheet1, { header: 1 });
        const getMonthDate = (col) => {
            // col 14 is June 2024. col 15 is July 2024, etc.
            const diff = col - 14;
            const d = new Date('2024-06-01T08:00:00Z');
            d.setMonth(d.getMonth() + diff);
            return d;
        };
        let insertedCount = 0;
        for (let i = 2; i < data1.length; i++) {
            const row = data1[i];
            if (!row || row.length === 0 || typeof row[0] !== 'number')
                continue;
            const nama = safeStr(row[1]);
            if (!nama)
                continue;
            // Find Anggota in DB
            const anggota = yield prisma.anggota.findFirst({
                where: { namaLengkap: nama }
            });
            if (!anggota) {
                console.log(`Anggota not found: ${nama}`);
                continue;
            }
            const simpananPokok = Number(row[13]) || 0;
            if (simpananPokok > 0) {
                yield prisma.mutasiSimpanan.create({
                    data: {
                        anggotaId: anggota.id,
                        jenisSimpanan: client_1.JenisSimpanan.POKOK,
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
                    yield prisma.mutasiSimpanan.create({
                        data: {
                            anggotaId: anggota.id,
                            jenisSimpanan: client_1.JenisSimpanan.WAJIB,
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
    });
}
fixSimpanan().then(() => prisma.$disconnect()).catch(e => { console.error(e); prisma.$disconnect(); });
