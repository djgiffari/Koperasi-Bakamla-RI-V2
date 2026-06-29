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
const express_1 = __importDefault(require("express"));
const client_1 = require("@prisma/client");
const router = express_1.default.Router();
const prisma = new client_1.PrismaClient();
router.get('/riwayat/:anggotaId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = parseInt(req.params.anggotaId);
        // 1. Ambil mutasi simpanan
        const mutasi = yield prisma.mutasiSimpanan.findMany({
            where: { anggotaId, status: 'DISETUJUI' },
        });
        // 2. Ambil pembayaran angsuran
        const angsuran = yield prisma.angsuran.findMany({
            where: { pinjaman: { anggotaId }, status: 'LUNAS' },
            include: { pinjaman: true }
        });
        // 3. Ambil riwayat SHU pencairan
        const shu = yield prisma.riwayatSHU.findMany({
            where: { anggotaId },
            include: { periode: true }
        });
        // 4. Ambil pencairan pinjaman
        const pinjaman = yield prisma.pinjaman.findMany({
            where: { anggotaId, status: 'DICAIRKAN' }
        });
        // 5. Ambil pembelanjaan Toko (lewat tagihanPaylater yang LUNAS atau BELUM_BAYAR)
        const orderToko = yield prisma.tagihanPaylater.findMany({
            where: { anggotaId },
            include: { order: true }
        });
        // Format jadi list tunggal
        const riwayat = [];
        mutasi.forEach(m => {
            riwayat.push({
                id: `mutasi_${m.id}`,
                tanggal: m.createdAt,
                jenis: m.jenisMutasi === 'SETORAN' ? 'masuk' : 'keluar',
                judul: `${m.jenisMutasi === 'SETORAN' ? 'Setoran' : 'Penarikan'} Simpanan ${m.jenisSimpanan.charAt(0) + m.jenisSimpanan.slice(1).toLowerCase()}`,
                nominal: m.nominal,
                status: m.status === 'DISETUJUI' ? 'SELESAI' : m.status,
            });
        });
        angsuran.forEach(a => {
            if (a.tanggalBayar) {
                riwayat.push({
                    id: `angsuran_${a.id}`,
                    tanggal: a.tanggalBayar,
                    jenis: 'keluar',
                    judul: `Pembayaran Angsuran ke-${a.bulanKe}`,
                    nominal: a.totalTagihan,
                    status: 'SELESAI',
                });
            }
        });
        shu.forEach(s => {
            riwayat.push({
                id: `shu_${s.id}`,
                tanggal: s.createdAt,
                jenis: 'masuk',
                judul: `Penerimaan SHU Tahun ${s.periode.tahun}`,
                nominal: s.totalSHU,
                status: 'SELESAI',
            });
        });
        pinjaman.forEach(p => {
            if (p.tanggalCair) {
                riwayat.push({
                    id: `pinjaman_${p.id}`,
                    tanggal: p.tanggalCair,
                    jenis: 'masuk',
                    judul: `Pencairan Pinjaman Umum`,
                    nominal: p.nominalCair,
                    status: 'SELESAI',
                });
            }
        });
        orderToko.forEach(ot => {
            riwayat.push({
                id: `toko_${ot.orderId}`,
                tanggal: ot.createdAt,
                jenis: 'keluar',
                judul: `Pembelanjaan Toko (${ot.order.metodePembayaran})`,
                nominal: ot.nominal,
                status: ot.order.status,
            });
        });
        // Urutkan terbaru ke terlama
        riwayat.sort((a, b) => b.tanggal.getTime() - a.tanggal.getTime());
        res.json(riwayat);
    }
    catch (error) {
        console.error('Error fetching riwayat transaksi:', error);
        res.status(500).json({ error: 'Gagal mengambil riwayat transaksi' });
    }
}));
exports.default = router;
