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
const audit_1 = require("../utils/audit");
const router = (0, express_1.Router)();
// GET all products (Katalog)
router.get('/produk', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const products = yield prisma_1.default.produk.findMany({
            where: { stok: { gt: 0 } }, // Only show products with stock
            orderBy: { nama: 'asc' }
        });
        res.json(products);
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal mengambil data produk' });
    }
}));
// POST new product (Admin)
router.post('/produk', (0, audit_1.auditLog)('CREATE_PRODUK', 'Produk'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { nama, kategori, hargaJual, hargaModal, stok, gambarUrl } = req.body;
        const product = yield prisma_1.default.produk.create({
            data: {
                nama,
                kategori,
                hargaJual: parseFloat(hargaJual),
                hargaModal: parseFloat(hargaModal),
                stok: parseInt(stok),
                gambarUrl
            }
        });
        res.status(201).json(product);
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal menambahkan produk' });
    }
}));
// POST Checkout (POS & Mobile)
router.post('/checkout', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, metodePembayaran, items } = req.body;
        // items = [{ produkId, jumlah }]
        if (!items || items.length === 0) {
            return res.status(400).json({ error: 'Keranjang kosong' });
        }
        const orderResult = yield prisma_1.default.$transaction((tx) => __awaiter(void 0, void 0, void 0, function* () {
            let totalHarga = 0;
            let orderItemsData = [];
            // Validasi stok & hitung harga
            for (const item of items) {
                const produk = yield tx.produk.findUnique({ where: { id: item.produkId } });
                if (!produk || produk.stok < item.jumlah) {
                    throw new Error(`Stok produk ${(produk === null || produk === void 0 ? void 0 : produk.nama) || item.produkId} tidak mencukupi`);
                }
                const hargaSatuan = produk.hargaJual;
                totalHarga += hargaSatuan * item.jumlah;
                orderItemsData.push({
                    produkId: item.produkId,
                    jumlah: item.jumlah,
                    hargaSatuan: hargaSatuan
                });
                // Kurangi stok
                yield tx.produk.update({
                    where: { id: item.produkId },
                    data: { stok: produk.stok - item.jumlah }
                });
            }
            // Validasi Pembayaran
            if (metodePembayaran === 'POTONG_SALDO') {
                const simpanan = yield tx.simpanan.findFirst({
                    where: { anggotaId, jenisSimpanan: 'SUKARELA' }
                });
                if (!simpanan || simpanan.saldo < totalHarga) {
                    throw new Error('Saldo simpanan sukarela tidak mencukupi untuk pembayaran ini');
                }
                // Kurangi saldo
                yield tx.simpanan.update({
                    where: { id: simpanan.id },
                    data: { saldo: simpanan.saldo - totalHarga }
                });
            }
            else if (metodePembayaran === 'PAYLATER') {
                // Cek limit paylater (misal 50% dari sisa gaji, di sini kita hardcode limit sederhana)
                const limitPaylater = 2000000;
                const tagihanAktif = yield tx.tagihanPaylater.aggregate({
                    where: { anggotaId, status: 'BELUM_BAYAR' },
                    _sum: { nominal: true }
                });
                const hutangBerjalan = tagihanAktif._sum.nominal || 0;
                if (hutangBerjalan + totalHarga > limitPaylater) {
                    throw new Error('Pembelian ditolak. Melebihi limit Paylater Anda (Rp 2.000.000)');
                }
            }
            // Buat Order
            const newOrder = yield tx.order.create({
                data: {
                    totalHarga,
                    metodePembayaran,
                    status: 'SELESAI', // Langsung selesai untuk POS digital
                    items: {
                        create: orderItemsData
                    }
                }
            });
            // Proses Jurnal & Tagihan pasca-order
            if (metodePembayaran === 'CASH' || metodePembayaran === 'TRANSFER' || metodePembayaran === 'POTONG_SALDO') {
                const kas = yield tx.kasKoperasi.findFirst();
                if (kas) {
                    yield tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: kas.saldo + totalHarga } });
                    yield tx.jurnalUmum.create({
                        data: {
                            keterangan: `Penjualan Toko (Order ID: ${newOrder.id}) via ${metodePembayaran}`,
                            jenis: 'DEBIT',
                            nominal: totalHarga,
                            saldoSetelahnya: kas.saldo + totalHarga,
                            referensiId: String(newOrder.id),
                            tipeReferensi: 'ORDER'
                        }
                    });
                }
            }
            else if (metodePembayaran === 'PAYLATER') {
                // Buat tagihan jatuh tempo bulan depan
                const date = new Date();
                const jatuhTempo = new Date(date.setMonth(date.getMonth() + 1));
                yield tx.tagihanPaylater.create({
                    data: {
                        orderId: newOrder.id,
                        anggotaId,
                        nominal: totalHarga,
                        status: 'BELUM_BAYAR',
                        jatuhTempo
                    }
                });
            }
            return newOrder;
        }));
        res.status(201).json({ message: 'Checkout berhasil', data: orderResult });
    }
    catch (error) {
        console.error('Error checkout POS:', error);
        res.status(400).json({ error: error.message || 'Gagal memproses checkout' });
    }
}));
exports.default = router;
