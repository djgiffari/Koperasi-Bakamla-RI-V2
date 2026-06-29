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
// GET all angsuran
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const angsuran = yield prisma_1.default.angsuran.findMany({
            include: {
                pinjaman: {
                    include: {
                        anggota: true
                    }
                }
            },
            orderBy: { createdAt: 'desc' }
        });
        res.json(angsuran);
    }
    catch (error) {
        console.error('Error fetching angsuran:', error);
        res.status(500).json({ error: 'Gagal mengambil data angsuran' });
    }
}));
// PUT update status angsuran (Verifikasi Pembayaran)
router.put('/:id/status', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { status } = req.body;
        if (!status)
            return res.status(400).json({ error: 'Status diperlukan' });
        // Use transaction to update Angsuran and add to KasKoperasi if LUNAS
        const updated = yield prisma_1.default.$transaction((tx) => __awaiter(void 0, void 0, void 0, function* () {
            const currentAngsuran = yield tx.angsuran.findUnique({ where: { id } });
            if ((currentAngsuran === null || currentAngsuran === void 0 ? void 0 : currentAngsuran.status) === 'LUNAS' && status === 'LUNAS') {
                throw new Error('Angsuran ini sudah berstatus LUNAS');
            }
            const angsuran = yield tx.angsuran.update({
                where: { id },
                data: {
                    status,
                    tanggalBayar: status === 'LUNAS' ? new Date() : null
                },
                include: { pinjaman: { include: { anggota: true } } }
            });
            if (status === 'LUNAS') {
                // Cek apakah kas sudah dicatat sebelumnya untuk angsuran ini
                const existingKas = yield tx.jurnalUmum.findFirst({
                    where: { referensiId: `ANGSURAN-${angsuran.id}` }
                });
                if (!existingKas) {
                    const saldoTerakhir = yield tx.jurnalUmum.findFirst({
                        orderBy: { createdAt: 'desc' }
                    });
                    const saldoBaru = ((saldoTerakhir === null || saldoTerakhir === void 0 ? void 0 : saldoTerakhir.saldoSetelahnya) || 0) + angsuran.totalTagihan;
                    yield tx.jurnalUmum.create({
                        data: {
                            jenis: 'DEBIT',
                            nominal: angsuran.totalTagihan,
                            keterangan: `Pembayaran Angsuran Pinjaman oleh ${angsuran.pinjaman.anggota.namaLengkap} (Ke-${angsuran.bulanKe})`,
                            saldoSetelahnya: saldoBaru,
                            referensiId: `ANGSURAN-${angsuran.id}`,
                            tipeReferensi: 'ANGSURAN'
                        }
                    });
                    // Update Kas Koperasi main balance
                    const kasUtama = yield tx.kasKoperasi.findFirst();
                    if (kasUtama) {
                        yield tx.kasKoperasi.update({
                            where: { id: kasUtama.id },
                            data: { saldo: kasUtama.saldo + angsuran.totalTagihan }
                        });
                    }
                    else {
                        yield tx.kasKoperasi.create({ data: { saldo: angsuran.totalTagihan } });
                    }
                }
            }
            return angsuran;
        }));
        res.json(updated);
    }
    catch (error) {
        console.error('Error updating status angsuran:', error);
        res.status(500).json({ error: 'Gagal memperbarui status angsuran' });
    }
}));
exports.default = router;
