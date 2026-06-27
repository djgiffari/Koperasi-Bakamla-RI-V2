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
const multer_1 = __importDefault(require("multer"));
const path_1 = __importDefault(require("path"));
const router = (0, express_1.Router)();
const storage = multer_1.default.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, 'bukti-simpanan-' + uniqueSuffix + path_1.default.extname(file.originalname));
    }
});
const upload = (0, multer_1.default)({ storage: storage });
// GET all balances (Simpanan Induk)
router.get('/saldo/:anggotaId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = parseInt(req.params.anggotaId);
        const simpanan = yield prisma_1.default.simpanan.findMany({
            where: { anggotaId }
        });
        res.json(simpanan);
    }
    catch (error) {
        console.error('Error fetching saldo simpanan:', error);
        res.status(500).json({ error: 'Gagal mengambil data saldo simpanan' });
    }
}));
// GET mutasi simpanan
router.get('/mutasi', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const mutasi = yield prisma_1.default.mutasiSimpanan.findMany({
            include: {
                anggota: true
            },
            orderBy: { createdAt: 'desc' }
        });
        res.json(mutasi);
    }
    catch (error) {
        console.error('Error fetching mutasi:', error);
        res.status(500).json({ error: 'Gagal mengambil data mutasi simpanan' });
    }
}));
// POST setor simpanan (Create Mutasi SETORAN)
router.post('/setor', upload.single('buktiFile'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, jenisSimpanan, nominal, keterangan } = req.body;
        if (!['POKOK', 'WAJIB', 'SUKARELA'].includes(jenisSimpanan)) {
            return res.status(400).json({ error: 'Jenis simpanan tidak valid' });
        }
        let buktiUrl = null;
        if (req.file) {
            buktiUrl = `/uploads/${req.file.filename}`;
        }
        const newMutasi = yield prisma_1.default.mutasiSimpanan.create({
            data: {
                anggotaId: parseInt(anggotaId),
                jenisSimpanan: jenisSimpanan,
                jenisMutasi: 'SETORAN',
                nominal: parseFloat(nominal),
                keterangan: keterangan || null,
                buktiUrl: buktiUrl,
                status: 'MENUNGGU_VERIFIKASI',
                isDivalidasiBank: false
            }
        });
        res.status(201).json({ message: 'Setoran berhasil dicatat dan menunggu verifikasi', data: newMutasi });
    }
    catch (error) {
        console.error('Error creating setoran:', error);
        res.status(500).json({ error: 'Gagal menambahkan setoran simpanan' });
    }
}));
// PUT verifikasi mutasi oleh bendahara
router.put('/mutasi/:id/verifikasi', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { status, isDivalidasiBank } = req.body;
        if (!['MENUNGGU_VERIFIKASI', 'DISETUJUI', 'DITOLAK'].includes(status)) {
            return res.status(400).json({ error: 'Status tidak valid' });
        }
        // Transaction to ensure balance is updated if approved
        const updatedMutasi = yield prisma_1.default.$transaction((tx) => __awaiter(void 0, void 0, void 0, function* () {
            const mutasi = yield tx.mutasiSimpanan.findUnique({ where: { id } });
            if (!mutasi)
                throw new Error('Mutasi tidak ditemukan');
            if (mutasi.status === 'DISETUJUI')
                throw new Error('Mutasi sudah pernah disetujui');
            const updated = yield tx.mutasiSimpanan.update({
                where: { id },
                data: {
                    status,
                    isDivalidasiBank: isDivalidasiBank !== undefined ? isDivalidasiBank : mutasi.isDivalidasiBank
                }
            });
            if (status === 'DISETUJUI') {
                // Cari induk simpanan
                let simpananInduk = yield tx.simpanan.findFirst({
                    where: { anggotaId: mutasi.anggotaId, jenisSimpanan: mutasi.jenisSimpanan }
                });
                // Jika belum ada, buat baru
                if (!simpananInduk) {
                    simpananInduk = yield tx.simpanan.create({
                        data: {
                            anggotaId: mutasi.anggotaId,
                            jenisSimpanan: mutasi.jenisSimpanan,
                            saldo: 0
                        }
                    });
                }
                // Update saldo
                const saldoBaru = mutasi.jenisMutasi === 'SETORAN'
                    ? simpananInduk.saldo + mutasi.nominal
                    : simpananInduk.saldo - mutasi.nominal;
                yield tx.simpanan.update({
                    where: { id: simpananInduk.id },
                    data: { saldo: saldoBaru }
                });
                // Catat ke Jurnal / Kas Koperasi
                const kas = yield tx.kasKoperasi.findFirst();
                if (kas) {
                    const saldoKasBaru = mutasi.jenisMutasi === 'SETORAN' ? kas.saldo + mutasi.nominal : kas.saldo - mutasi.nominal;
                    yield tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: saldoKasBaru } });
                    yield tx.jurnalUmum.create({
                        data: {
                            keterangan: `Verifikasi ${mutasi.jenisMutasi} Simpanan ${mutasi.jenisSimpanan} - Anggota ${mutasi.anggotaId}`,
                            jenis: mutasi.jenisMutasi === 'SETORAN' ? 'DEBIT' : 'KREDIT',
                            nominal: mutasi.nominal,
                            saldoSetelahnya: saldoKasBaru,
                            referensiId: String(mutasi.id),
                            tipeReferensi: 'SIMPANAN'
                        }
                    });
                }
            }
            return updated;
        }));
        res.json({ message: 'Status mutasi berhasil diupdate', data: updatedMutasi });
    }
    catch (error) {
        console.error('Error updating status:', error);
        res.status(500).json({ error: error.message || 'Gagal mengubah status mutasi' });
    }
}));
// POST penarikan simpanan sukarela
router.post('/tarik', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, nominal, bankTujuan, rekeningTujuan } = req.body;
        // Cek saldo sukarela
        const simpananSukarela = yield prisma_1.default.simpanan.findFirst({
            where: { anggotaId: parseInt(anggotaId), jenisSimpanan: 'SUKARELA' }
        });
        if (!simpananSukarela || simpananSukarela.saldo < parseFloat(nominal)) {
            return res.status(400).json({ error: 'Saldo simpanan sukarela tidak mencukupi' });
        }
        const penarikan = yield prisma_1.default.penarikanSimpanan.create({
            data: {
                anggotaId: parseInt(anggotaId),
                nominal: parseFloat(nominal),
                bankTujuan,
                rekeningTujuan,
                status: 'MENUNGGU_PERSETUJUAN'
            }
        });
        res.status(201).json({ message: 'Pengajuan penarikan berhasil, menunggu proses pencairan', data: penarikan });
    }
    catch (error) {
        console.error('Error pengajuan penarikan:', error);
        res.status(500).json({ error: 'Gagal mengajukan penarikan' });
    }
}));
exports.default = router;
