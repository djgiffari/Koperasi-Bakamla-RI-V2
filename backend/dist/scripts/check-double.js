"use strict";
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
const prisma = new client_1.PrismaClient();
function checkDouble() {
    return __awaiter(this, void 0, void 0, function* () {
        const simpanan = yield prisma.simpanan.aggregate({
            _sum: { saldo: true }
        });
        const mutasi = yield prisma.mutasiSimpanan.aggregate({
            _sum: { nominal: true }
        });
        const mutasiWajib = yield prisma.mutasiSimpanan.aggregate({
            where: { jenisSimpanan: 'WAJIB' },
            _sum: { nominal: true }
        });
        const simpananWajib = yield prisma.simpanan.aggregate({
            where: { jenisSimpanan: 'WAJIB' },
            _sum: { saldo: true }
        });
        const allWajib = yield prisma.simpanan.findMany({
            where: { jenisSimpanan: 'WAJIB' }
        });
        const allMutasi = yield prisma.mutasiSimpanan.findMany({
            where: { jenisSimpanan: 'WAJIB' }
        });
        console.log('Total Simpanan Saldo:', simpanan._sum.saldo);
        console.log('Total Mutasi Nominal:', mutasi._sum.nominal);
        console.log('Total Simpanan Wajib Saldo:', simpananWajib._sum.saldo);
        console.log('Total Mutasi Wajib Nominal:', mutasiWajib._sum.nominal);
        console.log('Count Simpanan Wajib rows:', allWajib.length);
        console.log('Count Mutasi Wajib rows:', allMutasi.length);
    });
}
checkDouble().then(() => prisma.$disconnect()).catch(e => { console.error(e); prisma.$disconnect(); });
