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
// GET Estimasi SHU untuk seorang Anggota (dipanggil oleh Mobile Dashboard)
router.get('/estimasi/:anggotaId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = parseInt(req.params.anggotaId);
        // 1. Ambil Total Kas / Laba Koperasi saat ini (Sederhananya: Saldo KasKoperasi - Total Simpanan Pokok & Wajib)
        const kas = yield prisma_1.default.kasKoperasi.findFirst();
        const totalShuBerjalan = kas ? kas.saldo * 0.2 : 0; // Simulasi 20% Kas adalah SHU Koperasi
        // Parameter pembagian (misal: Jasa Modal 40%, Jasa Anggota 60%)
        const porsiJasaModal = 0.4;
        const porsiJasaAnggota = 0.6;
        // 2. Hitung Jasa Modal Anggota
        const simpananAnggotaList = yield prisma_1.default.simpanan.findMany({ where: { anggotaId } });
        const simpananAnggota = simpananAnggotaList.reduce((acc, curr) => acc + curr.saldo, 0);
        const semuaSimpanan = yield prisma_1.default.simpanan.aggregate({ _sum: { saldo: true } });
        const totalSimpananKoperasi = semuaSimpanan._sum.saldo || 1;
        const bagianJasaModal = (simpananAnggota / totalSimpananKoperasi) * (totalShuBerjalan * porsiJasaModal);
        // 3. Hitung Jasa Anggota (Berdasarkan Pinjaman & Belanja)
        const pinjamanAnggota = yield prisma_1.default.pinjaman.aggregate({
            where: { anggotaId, status: 'DICAIRKAN' },
            _sum: { nominal: true }
        });
        const orderAnggota = yield prisma_1.default.order.aggregate({
            where: {
                tagihanPaylater: { anggotaId }
            },
            _sum: { totalHarga: true }
        });
        const totalTransaksiAnggota = (pinjamanAnggota._sum.nominal || 0) + (orderAnggota._sum.totalHarga || 0);
        const pinjamanSemua = yield prisma_1.default.pinjaman.aggregate({
            where: { status: 'DICAIRKAN' },
            _sum: { nominal: true }
        });
        const orderSemua = yield prisma_1.default.order.aggregate({
            _sum: { totalHarga: true }
        });
        const totalTransaksiKoperasi = (pinjamanSemua._sum.nominal || 0) + (orderSemua._sum.totalHarga || 0) || 1;
        const bagianJasaAnggota = (totalTransaksiAnggota / totalTransaksiKoperasi) * (totalShuBerjalan * porsiJasaAnggota);
        // 4. Total Estimasi SHU
        const estimasiShu = bagianJasaModal + bagianJasaAnggota;
        res.json({
            anggotaId,
            totalShuKoperasi: totalShuBerjalan,
            bagianJasaModal,
            bagianJasaAnggota,
            estimasiTotalShu: estimasiShu
        });
    }
    catch (error) {
        console.error('Error kalkulasi estimasi SHU:', error);
        res.status(500).json({ error: 'Gagal mengkalkulasi estimasi SHU' });
    }
}));
// POST Distribusi SHU Tahunan (Oleh Pengawas / Ketua)
router.post('/distribusi', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { tahun, totalSHUKotor, persenCadangan, persenPengurus, persenPendidikan, persenJasaModal, persenJasaAnggota } = req.body;
        const distribusi = yield prisma_1.default.$transaction((tx) => __awaiter(void 0, void 0, void 0, function* () {
            // 1. Buat Periode SHU
            const periode = yield tx.periodeSHU.create({
                data: {
                    tahun,
                    totalSHUKotor: parseFloat(totalSHUKotor),
                    persenCadangan: parseFloat(persenCadangan || 0),
                    persenPengurus: parseFloat(persenPengurus || 0),
                    persenPendidikan: parseFloat(persenPendidikan || 0),
                    persenJasaModal: parseFloat(persenJasaModal),
                    persenJasaAnggota: parseFloat(persenJasaAnggota)
                }
            });
            // 2. Kalkulasi porsi untuk setiap anggota dan bagikan secara otomatis sebagai Simpanan Sukarela
            const anggotaList = yield tx.anggota.findMany({ where: { status: 'AKTIF' } });
            const semuaSimpanan = yield tx.simpanan.aggregate({ _sum: { saldo: true } });
            const totalSimpanan = semuaSimpanan._sum.saldo || 1;
            const pinjamanSemua = yield tx.pinjaman.aggregate({ where: { status: 'DICAIRKAN' }, _sum: { nominal: true } });
            const orderSemua = yield tx.order.aggregate({ _sum: { totalHarga: true } });
            const totalTransaksi = (pinjamanSemua._sum.nominal || 0) + (orderSemua._sum.totalHarga || 0) || 1;
            for (const agt of anggotaList) {
                // Hitung Jasa Modal
                const simp = yield tx.simpanan.findMany({ where: { anggotaId: agt.id } });
                const simpAnggota = simp.reduce((a, c) => a + c.saldo, 0);
                const jm = (simpAnggota / totalSimpanan) * periode.totalSHUKotor * (periode.persenJasaModal / 100);
                // Hitung Jasa Anggota
                const pinj = yield tx.pinjaman.aggregate({ where: { anggotaId: agt.id, status: 'DICAIRKAN' }, _sum: { nominal: true } });
                const ord = yield tx.order.aggregate({ where: { tagihanPaylater: { anggotaId: agt.id } }, _sum: { totalHarga: true } });
                const trxAnggota = (pinj._sum.nominal || 0) + (ord._sum.totalHarga || 0);
                const ja = (trxAnggota / totalTransaksi) * periode.totalSHUKotor * (periode.persenJasaAnggota / 100);
                const totalDidapat = jm + ja;
                if (totalDidapat > 0) {
                    // Buat riwayat SHU
                    yield tx.riwayatSHU.create({
                        data: {
                            periodeId: periode.id,
                            anggotaId: agt.id,
                            nominalJasaModal: jm,
                            nominalJasaAnggota: ja,
                            totalSHU: totalDidapat,
                            statusPencairan: 'DITAHAN_DI_SIMPANAN'
                        }
                    });
                    // Masukkan ke Simpanan Sukarela
                    let sukarela = yield tx.simpanan.findFirst({ where: { anggotaId: agt.id, jenisSimpanan: 'SUKARELA' } });
                    if (!sukarela) {
                        sukarela = yield tx.simpanan.create({
                            data: { anggotaId: agt.id, jenisSimpanan: 'SUKARELA', saldo: 0 }
                        });
                    }
                    yield tx.simpanan.update({
                        where: { id: sukarela.id },
                        data: { saldo: sukarela.saldo + totalDidapat }
                    });
                }
            }
            return periode;
        }));
        res.json({ message: 'Distribusi SHU berhasil', data: distribusi });
    }
    catch (error) {
        console.error('Error distribusi SHU:', error);
        res.status(500).json({ error: 'Gagal melakukan distribusi SHU' });
    }
}));
exports.default = router;
