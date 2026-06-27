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
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const totalAnggota = yield prisma_1.default.anggota.count();
        const allSimpanan = yield prisma_1.default.simpanan.findMany();
        const totalSimpanan = allSimpanan.reduce((acc, curr) => acc + curr.saldo, 0);
        const allPinjaman = yield prisma_1.default.pinjaman.findMany({
            where: {
                status: {
                    notIn: ['LUNAS', 'DITOLAK']
                }
            }
        });
        const pinjamanAktif = allPinjaman.reduce((acc, curr) => acc + curr.nominal, 0);
        // Get recent activities (last 5 pinjaman or simpanan)
        const recentSimpanan = yield prisma_1.default.simpanan.findMany({
            take: 3,
            orderBy: { createdAt: 'desc' },
            include: { anggota: true }
        });
        const recentPinjaman = yield prisma_1.default.pinjaman.findMany({
            take: 3,
            orderBy: { createdAt: 'desc' },
            include: { anggota: true }
        });
        const pendingApprovals = [
            ...recentPinjaman.filter(p => p.status === 'PENDING_ADMIN' || p.status === 'PENDING_BENDAHARA').map(p => {
                var _a;
                return ({
                    id: `PNJ-${p.id}`,
                    name: ((_a = p.anggota) === null || _a === void 0 ? void 0 : _a.namaLengkap) || 'Unknown',
                    type: 'Pinjaman',
                    amount: `Rp ${p.nominal.toLocaleString('id-ID')}`,
                    date: p.createdAt.toISOString()
                });
            })
        ];
        const recentActivities = [
            ...recentSimpanan.map(s => {
                var _a;
                return ({
                    id: `s-${s.id}`,
                    name: ((_a = s.anggota) === null || _a === void 0 ? void 0 : _a.namaLengkap) || 'Unknown',
                    action: `Menyetor Simpanan ${s.jenisSimpanan}`,
                    time: s.createdAt.toISOString(),
                    status: 'success'
                });
            }),
            ...recentPinjaman.map(p => {
                var _a;
                return ({
                    id: `p-${p.id}`,
                    name: ((_a = p.anggota) === null || _a === void 0 ? void 0 : _a.namaLengkap) || 'Unknown',
                    action: 'Mengajukan Pinjaman',
                    time: p.createdAt.toISOString(),
                    status: p.status === 'DICAIRKAN' ? 'success' : 'pending'
                });
            })
        ].sort((a, b) => new Date(b.time).getTime() - new Date(a.time).getTime()).slice(0, 5);
        res.json({
            metrics: {
                totalAnggota,
                totalSimpanan,
                pinjamanAktif,
                omsetToko: 0 // dummy for now
            },
            pendingApprovals,
            recentActivities
        });
    }
    catch (error) {
        console.error('Error fetching dashboard data:', error);
        res.status(500).json({ error: 'Gagal mengambil data dashboard' });
    }
}));
exports.default = router;
