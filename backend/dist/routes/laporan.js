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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const prisma_1 = __importDefault(require("../utils/prisma"));
const router = (0, express_1.Router)();
// GET rekap laporan kas & jurnal
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { startDate, endDate, jenis } = req.query;
        const filter = {};
        if (startDate && endDate) {
            filter.tanggal = {
                gte: new Date(startDate),
                lte: new Date(endDate)
            };
        }
        if (jenis) {
            filter.jenis = jenis; // 'DEBIT' | 'KREDIT'
        }
        const jurnalList = yield prisma_1.default.jurnalUmum.findMany({
            where: filter,
            orderBy: { tanggal: 'desc' }
        });
        const totalDebit = yield prisma_1.default.jurnalUmum.aggregate({
            where: Object.assign(Object.assign({}, filter), { jenis: 'DEBIT' }),
            _sum: { nominal: true }
        });
        const totalKredit = yield prisma_1.default.jurnalUmum.aggregate({
            where: Object.assign(Object.assign({}, filter), { jenis: 'KREDIT' }),
            _sum: { nominal: true }
        });
        const kasSekarang = yield prisma_1.default.kasKoperasi.findFirst();
        res.json({
            kasSekarang: (kasSekarang === null || kasSekarang === void 0 ? void 0 : kasSekarang.saldo) || 0,
            totalPemasukan: totalDebit._sum.nominal || 0,
            totalPengeluaran: totalKredit._sum.nominal || 0,
            jurnal: jurnalList
        });
    }
    catch (error) {
        console.error('Error fetching laporan:', error);
        res.status(500).json({ error: 'Gagal mengambil data laporan' });
    }
}));
exports.default = router;
