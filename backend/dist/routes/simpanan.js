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
const auth_1 = require("../middleware/auth");
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
// GET all mutasi simpanan (used by Dashboard and Simpanan list)
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const mutasi = yield prisma_1.default.mutasiSimpanan.findMany({
            include: { anggota: true },
            orderBy: { createdAt: 'desc' }
        });
        // Map data for frontend
        const mapped = mutasi.map((m) => (Object.assign(Object.assign({}, m), { saldo: m.nominal, kodeAkun: m.keterangan || '-', kodeInvoice: `INV-${m.id.toString().padStart(4, '0')}` })));
        res.json(mapped);
    }
    catch (error) {
        console.error('Error fetching mutasi:', error);
        res.status(500).json({ error: 'Gagal mengambil data mutasi simpanan' });
    }
}));
// GET mutasi simpanan (backward compatibility)
router.get('/mutasi', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const mutasi = yield prisma_1.default.mutasiSimpanan.findMany({
            include: { anggota: true },
            orderBy: { createdAt: 'desc' }
        });
        res.json(mutasi);
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal' });
    }
}));
// GET all balances (Simpanan Induk)
router.get('/saldo/:anggotaId', auth_1.authenticateToken, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(req.params.anggotaId);
        const simpanan = yield prisma_1.default.simpanan.findMany({
            where: { anggotaId }
        });
        res.json(simpanan);
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal mengambil data saldo simpanan' });
    }
}));
// GET riwayat mutasi simpanan untuk anggota tertentu
router.get('/riwayat/:anggotaId', auth_1.authenticateToken, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(req.params.anggotaId);
        const mutasi = yield prisma_1.default.mutasiSimpanan.findMany({
            where: { anggotaId },
            orderBy: { createdAt: 'desc' }
        });
        res.json(mutasi);
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal mengambil riwayat simpanan' });
    }
}));
// POST setor simpanan (Create Mutasi SETORAN) - Used by frontend POST /simpanan
router.post('/', auth_1.authenticateToken, upload.single('buktiFile'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, jenisSimpanan, saldo, nominal, kodeAkun, keterangan, tanggal } = req.body;
        if (!['POKOK', 'WAJIB', 'SUKARELA'].includes(jenisSimpanan)) {
            return res.status(400).json({ error: 'Jenis simpanan tidak valid' });
        }
        const amount = parseFloat(saldo || nominal || '0');
        if (amount <= 0) {
            return res.status(400).json({ error: 'Nominal setoran harus lebih besar dari 0' });
        }
        let buktiUrl = null;
        if (req.file) {
            buktiUrl = `/uploads/${req.file.filename}`;
        }
        let validAnggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(anggotaId);
        const anggotaExist = yield prisma_1.default.anggota.findUnique({ where: { id: validAnggotaId } });
        if (!anggotaExist) {
            return res.status(404).json({ error: 'Data anggota tidak ditemukan' });
        }
        const newMutasi = yield prisma_1.default.mutasiSimpanan.create({
            data: {
                anggotaId: validAnggotaId,
                jenisSimpanan: jenisSimpanan,
                jenisMutasi: 'SETORAN',
                nominal: amount,
                keterangan: kodeAkun || keterangan || null,
                buktiUrl: buktiUrl,
                status: 'MENUNGGU_VERIFIKASI',
                isDivalidasiBank: false,
                createdAt: tanggal ? new Date(tanggal) : undefined
            }
        });
        res.status(201).json({ message: 'Setoran berhasil dicatat', data: newMutasi });
    }
    catch (error) {
        console.error('Error creating setoran:', error);
        res.status(500).json({ error: 'Gagal menambahkan setoran simpanan' });
    }
}));
// PUT verifikasi mutasi
router.put('/:id/status', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { status, isDivalidasiBank } = req.body;
        if (!['MENUNGGU_VERIFIKASI', 'DISETUJUI', 'DITOLAK'].includes(status)) {
            return res.status(400).json({ error: 'Status tidak valid' });
        }
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
                let simpananInduk = yield tx.simpanan.findFirst({
                    where: { anggotaId: mutasi.anggotaId, jenisSimpanan: mutasi.jenisSimpanan }
                });
                if (!simpananInduk) {
                    simpananInduk = yield tx.simpanan.create({
                        data: { anggotaId: mutasi.anggotaId, jenisSimpanan: mutasi.jenisSimpanan, saldo: 0 }
                    });
                }
                const saldoBaru = mutasi.jenisMutasi === 'SETORAN'
                    ? simpananInduk.saldo + mutasi.nominal
                    : simpananInduk.saldo - mutasi.nominal;
                yield tx.simpanan.update({
                    where: { id: simpananInduk.id },
                    data: { saldo: saldoBaru }
                });
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
        res.status(500).json({ error: error.message || 'Gagal mengubah status mutasi' });
    }
}));
router.delete('/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield prisma_1.default.mutasiSimpanan.delete({
            where: { id: parseInt(req.params.id) }
        });
        res.json({ message: 'Deleted' });
    }
    catch (e) {
        res.status(500).json({ error: 'Failed' });
    }
}));
// POST penarikan simpanan sukarela
router.post('/tarik', auth_1.authenticateToken, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, nominal, bankTujuan, rekeningTujuan } = req.body;
        let validAnggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(anggotaId);
        const simpananSukarela = yield prisma_1.default.simpanan.findFirst({
            where: { anggotaId: validAnggotaId, jenisSimpanan: 'SUKARELA' }
        });
        if (!simpananSukarela || simpananSukarela.saldo < parseFloat(nominal)) {
            return res.status(400).json({ error: 'Saldo simpanan sukarela tidak mencukupi' });
        }
        const penarikan = yield prisma_1.default.penarikanSimpanan.create({
            data: {
                anggotaId: validAnggotaId,
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
// GET data laporan simpanan
router.get('/laporan/data', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { startDate, endDate, sortBy } = req.query;
        let whereClause = {
            status: 'DISETUJUI'
        };
        if (startDate && endDate) {
            whereClause.createdAt = {
                gte: new Date(startDate),
                lte: new Date(endDate)
            };
        }
        const mutasi = yield prisma_1.default.mutasiSimpanan.findMany({
            where: whereClause,
            include: { anggota: true },
            orderBy: sortBy === 'nama'
                ? { anggota: { namaLengkap: 'asc' } }
                : { createdAt: 'desc' }
        });
        let totalPokok = 0;
        let totalWajib = 0;
        let totalSukarela = 0;
        const mapped = mutasi.map((m) => {
            const nominal = m.jenisMutasi === 'SETORAN' ? m.nominal : -m.nominal;
            if (m.jenisSimpanan === 'POKOK')
                totalPokok += nominal;
            if (m.jenisSimpanan === 'WAJIB')
                totalWajib += nominal;
            if (m.jenisSimpanan === 'SUKARELA')
                totalSukarela += nominal;
            return Object.assign(Object.assign({}, m), { saldo: m.nominal, kodeInvoice: `INV-${m.id.toString().padStart(4, '0')}` });
        });
        res.json({
            summary: { totalPokok, totalWajib, totalSukarela, totalSemua: totalPokok + totalWajib + totalSukarela },
            data: mapped
        });
    }
    catch (error) {
        console.error('Error generate laporan:', error);
        res.status(500).json({ error: 'Gagal men-generate laporan' });
    }
}));
// PUT edit mutasi simpanan
router.put('/:id', upload.single('buktiFile'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { jenisSimpanan, nominal, keterangan, tanggal } = req.body;
        const newNominal = parseFloat(nominal);
        const updatedMutasi = yield prisma_1.default.$transaction((tx) => __awaiter(void 0, void 0, void 0, function* () {
            const mutasi = yield tx.mutasiSimpanan.findUnique({ where: { id } });
            if (!mutasi)
                throw new Error('Mutasi tidak ditemukan');
            let buktiUrl = mutasi.buktiUrl;
            if (req.file) {
                buktiUrl = `/uploads/${req.file.filename}`;
            }
            const delta = newNominal - mutasi.nominal;
            const requiresBalanceUpdate = (delta !== 0 && mutasi.status === 'DISETUJUI');
            // Update the Mutasi
            const updated = yield tx.mutasiSimpanan.update({
                where: { id },
                data: {
                    jenisSimpanan: jenisSimpanan,
                    nominal: newNominal,
                    keterangan: keterangan || mutasi.keterangan,
                    buktiUrl: buktiUrl,
                    createdAt: tanggal ? new Date(tanggal) : mutasi.createdAt
                }
            });
            if (requiresBalanceUpdate) {
                // Adjust Simpanan
                const simpananInduk = yield tx.simpanan.findFirst({
                    where: { anggotaId: mutasi.anggotaId, jenisSimpanan: mutasi.jenisSimpanan }
                });
                if (simpananInduk) {
                    const adj = mutasi.jenisMutasi === 'SETORAN' ? delta : -delta;
                    yield tx.simpanan.update({
                        where: { id: simpananInduk.id },
                        data: { saldo: simpananInduk.saldo + adj }
                    });
                }
                // Adjust Kas Koperasi
                const kas = yield tx.kasKoperasi.findFirst();
                if (kas) {
                    const kasAdj = mutasi.jenisMutasi === 'SETORAN' ? delta : -delta;
                    yield tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: kas.saldo + kasAdj } });
                    yield tx.jurnalUmum.create({
                        data: {
                            keterangan: `Penyesuaian Edit ${mutasi.jenisMutasi} Simpanan ${mutasi.jenisSimpanan} - Anggota ${mutasi.anggotaId}`,
                            jenis: kasAdj > 0 ? 'DEBIT' : 'KREDIT',
                            nominal: Math.abs(kasAdj),
                            saldoSetelahnya: kas.saldo + kasAdj,
                            referensiId: String(mutasi.id),
                            tipeReferensi: 'SIMPANAN_EDIT'
                        }
                    });
                }
            }
            // Log Aktivitas via raw query into AuditTrail
            try {
                const ip = req.ip || req.connection.remoteAddress || 'Unknown';
                const ua = req.headers['user-agent'] || 'Unknown';
                // Format action matching the frontend expectations (e.g. 'PUT MutasiSimpanan')
                yield tx.$executeRawUnsafe('INSERT INTO "AuditTrail" (action, "entityName", "entityId", "newData", "ipAddress", "userAgent", "createdAt") VALUES ($1, $2, $3, $4, $5, $6, NOW())', 'PUT', 'MutasiSimpanan', String(id), JSON.stringify({ old: mutasi.nominal, new: newNominal }), ip, ua);
            }
            catch (e) {
                console.error('Failed to write AuditTrail:', e);
            }
            return updated;
        }));
        res.json({ message: 'Mutasi berhasil diupdate', data: updatedMutasi });
    }
    catch (error) {
        console.error('Error editing mutasi:', error);
        res.status(500).json({ error: error.message || 'Gagal mengubah mutasi' });
    }
}));
exports.default = router;
