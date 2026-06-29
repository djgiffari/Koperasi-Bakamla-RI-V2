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
// PUT update product
router.put('/produk/:id', (0, audit_1.auditLog)('UPDATE_PRODUK', 'Produk'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { nama, kategori, hargaJual, hargaModal, stok, gambarUrl } = req.body;
        const product = yield prisma_1.default.produk.update({
            where: { id },
            data: {
                nama,
                kategori,
                hargaJual: parseFloat(hargaJual),
                hargaModal: parseFloat(hargaModal),
                stok: parseInt(stok),
                gambarUrl
            }
        });
        res.json(product);
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal mengubah produk' });
    }
}));
// DELETE product
router.delete('/produk/:id', (0, audit_1.auditLog)('DELETE_PRODUK', 'Produk'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        yield prisma_1.default.produk.delete({ where: { id } });
        res.json({ message: 'Produk berhasil dihapus' });
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal menghapus produk' });
    }
}));
// GET all orders (Untuk POS dashboard)
router.get('/order', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const orders = yield prisma_1.default.order.findMany({
            include: { tagihanPaylater: { include: { anggota: true } } },
            orderBy: { createdAt: 'desc' }
        });
        res.json(orders);
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal mengambil data pesanan' });
    }
}));
// GET user orders (Untuk Mobile Riwayat Toko)
router.get('/order/anggota/:anggotaId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let validAnggotaId = parseInt(req.params.anggotaId);
        const anggotaExist = yield prisma_1.default.anggota.findUnique({ where: { id: validAnggotaId } });
        if (!anggotaExist) {
            return res.status(404).json({ error: 'Data anggota tidak ditemukan' });
        }
        // Cari semua order yang terkait dengan anggota ini via TagihanPaylater
        const tagihans = yield prisma_1.default.tagihanPaylater.findMany({
            where: { anggotaId: validAnggotaId },
            include: {
                order: {
                    include: {
                        items: {
                            include: { produk: true }
                        }
                    }
                }
            },
            orderBy: { createdAt: 'desc' }
        });
        const orders = tagihans.map(t => t.order);
        res.json(orders);
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal mengambil riwayat pesanan toko' });
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
                if (item.jumlah <= 0) {
                    throw new Error('Jumlah pesanan tidak valid');
                }
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
            // Validasi Pembayaran untuk Potong Saldo
            if (metodePembayaran === 'POTONG_SALDO') {
                if (!anggotaId)
                    throw new Error('POTONG_SALDO hanya untuk anggota');
                const simpanan = yield tx.simpanan.findFirst({
                    where: { anggotaId, jenisSimpanan: 'SUKARELA' }
                });
                if (!simpanan || simpanan.saldo < totalHarga) {
                    throw new Error('Saldo simpanan sukarela tidak mencukupi untuk pembayaran ini');
                }
            }
            let validAnggotaId = typeof anggotaId === 'string' ? parseInt(anggotaId) : anggotaId;
            let isOnline = validAnggotaId != null;
            if (isOnline) {
                const anggotaExist = yield tx.anggota.findUnique({ where: { id: validAnggotaId } });
                if (!anggotaExist) {
                    throw new Error('Data anggota tidak ditemukan');
                }
            }
            const initialStatus = isOnline ? 'PENDING' : 'SELESAI';
            // Buat Order
            const newOrder = yield tx.order.create({
                data: {
                    totalHarga,
                    metodePembayaran,
                    status: initialStatus,
                    items: {
                        create: orderItemsData
                    }
                }
            });
            // Jika offline, langsung proses pembayaran
            if (!isOnline) {
                if (metodePembayaran === 'CASH' || metodePembayaran === 'TRANSFER') {
                    const kas = yield tx.kasKoperasi.findFirst();
                    if (kas) {
                        yield tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: kas.saldo + totalHarga } });
                        yield tx.jurnalUmum.create({
                            data: {
                                keterangan: `Penjualan Toko (Order ID: ${newOrder.id}) via ${metodePembayaran} (Offline)`,
                                jenis: 'DEBIT',
                                nominal: totalHarga,
                                saldoSetelahnya: kas.saldo + totalHarga,
                                referensiId: String(newOrder.id),
                                tipeReferensi: 'ORDER'
                            }
                        });
                    }
                }
            }
            else if (isOnline) {
                // Gunakan TagihanPaylater sebagai penghubung Order ke Anggota (baik Paylater maupun Tunai/Transfer/Potong Saldo online)
                // Agar admin tahu siapa yang memesan dan masuk ke riwayat pembelanjaan anggota
                const date = new Date();
                const jatuhTempo = new Date(date.setMonth(date.getMonth() + 1));
                yield tx.tagihanPaylater.create({
                    data: {
                        orderId: newOrder.id,
                        anggotaId: validAnggotaId,
                        nominal: totalHarga,
                        status: 'BELUM_BAYAR', // Nanti jadi LUNAS saat diverifikasi POS
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
// PUT Verify Online Order (Admin POS)
router.put('/order/:id/verify', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const orderId = parseInt(req.params.id);
        const { anggotaId } = req.body; // Butuh anggotaId jika metode POTONG_SALDO
        const orderResult = yield prisma_1.default.$transaction((tx) => __awaiter(void 0, void 0, void 0, function* () {
            const order = yield tx.order.findUnique({ where: { id: orderId } });
            if (!order)
                throw new Error('Pesanan tidak ditemukan');
            if (order.status === 'SELESAI')
                throw new Error('Pesanan sudah diverifikasi/selesai');
            if (order.metodePembayaran === 'POTONG_SALDO') {
                if (!anggotaId)
                    throw new Error('Anggota ID diperlukan untuk potongan saldo');
                const simpanan = yield tx.simpanan.findFirst({
                    where: { anggotaId, jenisSimpanan: 'SUKARELA' }
                });
                if (!simpanan || simpanan.saldo < order.totalHarga) {
                    throw new Error('Saldo simpanan sukarela anggota tidak mencukupi saat ini');
                }
                yield tx.simpanan.update({
                    where: { id: simpanan.id },
                    data: { saldo: simpanan.saldo - order.totalHarga }
                });
            }
            // Jurnal & Kas
            if (order.metodePembayaran === 'CASH' || order.metodePembayaran === 'TRANSFER' || order.metodePembayaran === 'POTONG_SALDO') {
                const kas = yield tx.kasKoperasi.findFirst();
                if (kas) {
                    yield tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: kas.saldo + order.totalHarga } });
                    yield tx.jurnalUmum.create({
                        data: {
                            keterangan: `Penjualan Toko (Order ID: ${order.id}) via ${order.metodePembayaran} (Verified)`,
                            jenis: 'DEBIT',
                            nominal: order.totalHarga,
                            saldoSetelahnya: kas.saldo + order.totalHarga,
                            referensiId: String(order.id),
                            tipeReferensi: 'ORDER'
                        }
                    });
                }
            }
            // Update status TagihanPaylater menjadi LUNAS jika ada
            yield tx.tagihanPaylater.updateMany({
                where: { orderId: orderId },
                data: { status: 'LUNAS', tanggalBayar: new Date() }
            });
            // Update order status
            const updatedOrder = yield tx.order.update({
                where: { id: orderId },
                data: { status: 'SELESAI' }
            });
            return updatedOrder;
        }));
        res.json({ message: 'Pesanan berhasil diverifikasi', data: orderResult });
    }
    catch (error) {
        res.status(400).json({ error: error.message || 'Gagal memverifikasi pesanan' });
    }
}));
// PUT Cancel Online Order (Admin POS)
router.put('/order/:id/cancel', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const orderId = parseInt(req.params.id);
        const orderResult = yield prisma_1.default.$transaction((tx) => __awaiter(void 0, void 0, void 0, function* () {
            const order = yield tx.order.findUnique({
                where: { id: orderId },
                include: { items: true }
            });
            if (!order)
                throw new Error('Pesanan tidak ditemukan');
            if (order.status !== 'PENDING')
                throw new Error('Hanya pesanan PENDING yang bisa dibatalkan');
            // Kembalikan stok
            for (const item of order.items) {
                const produk = yield tx.produk.findUnique({ where: { id: item.produkId } });
                if (produk) {
                    yield tx.produk.update({
                        where: { id: produk.id },
                        data: { stok: produk.stok + item.jumlah }
                    });
                }
            }
            // Reversal Jurnal & Kas jika order OFFLINE (CASH / TRANSFER)
            // Karena saat checkout langsung masuk Kas
            if (order.metodePembayaran === 'CASH' || order.metodePembayaran === 'TRANSFER') {
                const kas = yield tx.kasKoperasi.findFirst();
                if (kas) {
                    // Kurangi saldo karena pesanan dibatalkan
                    yield tx.kasKoperasi.update({
                        where: { id: kas.id },
                        data: { saldo: kas.saldo - order.totalHarga }
                    });
                    yield tx.jurnalUmum.create({
                        data: {
                            keterangan: `Pembatalan Penjualan Toko (Order ID: ${order.id}) via ${order.metodePembayaran}`,
                            jenis: 'KREDIT',
                            nominal: order.totalHarga,
                            saldoSetelahnya: kas.saldo - order.totalHarga,
                            referensiId: String(order.id),
                            tipeReferensi: 'ORDER_CANCEL'
                        }
                    });
                }
            }
            // Kembalikan status Order menjadi BATAL (tidak dihapus agar ada di riwayat pembeli)
            const updatedOrder = yield tx.order.update({
                where: { id: orderId },
                data: { status: 'BATAL' }
            });
            // Update juga tagihan paylater menjadi BATAL (karena asalnya BELUM_BAYAR/LUNAS, tapi ini pembatalan)
            // Kita asumsikan kalau enum StatusAngsuran tidak ada BATAL, kita biarkan saja tapi hapus nominalnya jadi 0, 
            // Atau lebih baik kita tidak hapus tagihannya agar relasi order-anggota tetap ada (sehingga bisa dilacak),
            // Tapi update nominal jadi 0 agar tidak jadi hutang.
            yield tx.tagihanPaylater.updateMany({
                where: { orderId: orderId },
                data: { nominal: 0 }
            });
            return updatedOrder;
        }));
        res.json({ message: 'Pesanan berhasil dibatalkan', data: orderResult });
    }
    catch (error) {
        res.status(400).json({ error: error.message || 'Gagal membatalkan pesanan' });
    }
}));
exports.default = router;
