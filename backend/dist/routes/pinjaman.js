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
        cb(null, 'pinjaman-' + uniqueSuffix + path_1.default.extname(file.originalname));
    }
});
const upload = (0, multer_1.default)({ storage: storage });
// Helper for Plafon
function hitungPlafonMaksimal(anggotaId) {
    return __awaiter(this, void 0, void 0, function* () {
        const simpanan = yield prisma_1.default.simpanan.findMany({ where: { anggotaId } });
        const totalSimpanan = simpanan.reduce((acc, curr) => acc + curr.saldo, 0);
        // Asumsi: Plafon Maksimal adalah 3x Total Simpanan (bisa diubah via PengaturanUmum)
        const pengaturan = yield prisma_1.default.pengaturanUmum.findFirst({ where: { kategori: 'MULTIPLIER_PLAFON' } });
        const multiplier = pengaturan ? parseFloat(pengaturan.nilai) : 3;
        return totalSimpanan * multiplier;
    });
}
// GET all pinjaman
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const pinjaman = yield prisma_1.default.pinjaman.findMany({
            include: { anggota: true },
            orderBy: { createdAt: 'desc' }
        });
        res.json(pinjaman);
    }
    catch (error) {
        console.error('Error fetching pinjaman:', error);
        res.status(500).json({ error: 'Gagal mengambil data pinjaman' });
    }
}));
// GET pinjaman by anggotaId (Mobile)
router.get('/mobile/:anggotaId', auth_1.authenticateToken, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(req.params.anggotaId);
        const pinjaman = yield prisma_1.default.pinjaman.findMany({
            where: { anggotaId },
            include: {
                angsuran: true
            },
            orderBy: { createdAt: 'desc' }
        });
        res.json(pinjaman);
    }
    catch (error) {
        console.error('Error fetching pinjaman anggota:', error);
        res.status(500).json({ error: 'Gagal mengambil data pinjaman anggota' });
    }
}));
// GET all angsuran
router.get('/angsuran', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const angsuran = yield prisma_1.default.angsuran.findMany({
            include: {
                pinjaman: {
                    include: { anggota: true }
                }
            },
            orderBy: { jatuhTempo: 'asc' }
        });
        res.json(angsuran);
    }
    catch (error) {
        console.error('Error fetching angsuran:', error);
        res.status(500).json({ error: 'Gagal mengambil data angsuran' });
    }
}));
// POST new pinjaman
router.post('/', auth_1.authenticateToken, upload.fields([{ name: 'ktpFile', maxCount: 1 }, { name: 'slipGajiFile', maxCount: 1 }]), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, nominal, tenor, skemaBunga } = req.body;
        const parsedNominal = parseFloat(nominal);
        if (parsedNominal <= 0) {
            return res.status(400).json({ error: 'Nominal pinjaman harus lebih besar dari 0' });
        }
        let validAnggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(anggotaId);
        const anggotaExist = yield prisma_1.default.anggota.findUnique({ where: { id: validAnggotaId } });
        if (!anggotaExist) {
            return res.status(404).json({ error: 'Data anggota tidak ditemukan' });
        }
        const plafon = yield hitungPlafonMaksimal(validAnggotaId);
        if (parsedNominal > plafon) {
            return res.status(400).json({ error: `Nominal melebihi plafon pinjaman maksimal (Rp ${plafon})` });
        }
        const files = (req.files || {});
        const fileKtpUrl = files['ktpFile'] ? `/uploads/${files['ktpFile'][0].filename}` : null;
        const fileSlipGajiUrl = files['slipGajiFile'] ? `/uploads/${files['slipGajiFile'][0].filename}` : null;
        // Ambil Pengaturan Biaya
        const settingAdmin = yield prisma_1.default.pengaturanUmum.findFirst({ where: { kategori: 'BIAYA_ADMIN_PINJAMAN' } });
        const settingAsuransi = yield prisma_1.default.pengaturanUmum.findFirst({ where: { kategori: 'BIAYA_ASURANSI_PINJAMAN' } });
        const settingBunga = yield prisma_1.default.pengaturanUmum.findFirst({ where: { kategori: 'BUNGA_PINJAMAN' } });
        // Asumsi nilai persentase, default 1% admin, 0.5% asuransi, 1.5% bunga
        const persenAdmin = settingAdmin ? parseFloat(settingAdmin.nilai) : 1.0;
        const persenAsuransi = settingAsuransi ? parseFloat(settingAsuransi.nilai) : 0.5;
        const bungaPersen = settingBunga ? parseFloat(settingBunga.nilai) : 1.5;
        const biayaAdmin = parsedNominal * (persenAdmin / 100);
        const biayaAsuransi = parsedNominal * (persenAsuransi / 100);
        const nominalCair = parsedNominal - biayaAdmin - biayaAsuransi;
        const newPinjaman = yield prisma_1.default.pinjaman.create({
            data: {
                anggotaId: validAnggotaId,
                nominal: parsedNominal,
                tenor: parseInt(tenor),
                skemaBunga: skemaBunga || 'FLAT',
                bungaPersen: bungaPersen,
                biayaAdmin,
                biayaAsuransi,
                nominalCair,
                plafonMaksimal: plafon,
                status: parsedNominal >= 10000000 ? 'PENDING_KETUA' : 'PENDING_ADMIN',
                fileKtpUrl,
                fileSlipGajiUrl
            },
            include: { anggota: true }
        });
        res.status(201).json({ message: 'Pengajuan pinjaman berhasil', data: newPinjaman });
    }
    catch (error) {
        console.error('Error creating pinjaman:', error);
        res.status(500).json({ error: 'Gagal menambahkan data pinjaman' });
    }
}));
// PUT update status & Cairkan
router.put('/:id/status', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { status } = req.body; // e.g. DICAIRKAN
        const updatedPinjaman = yield prisma_1.default.$transaction((tx) => __awaiter(void 0, void 0, void 0, function* () {
            const pinjaman = yield tx.pinjaman.findUnique({ where: { id } });
            if (!pinjaman)
                throw new Error('Pinjaman tidak ditemukan');
            if (pinjaman.status === 'DICAIRKAN')
                throw new Error('Pinjaman sudah pernah dicairkan');
            const updated = yield tx.pinjaman.update({
                where: { id },
                data: {
                    status,
                    tanggalCair: status === 'DICAIRKAN' ? new Date() : undefined
                }
            });
            if (status === 'DICAIRKAN') {
                // Cek kas koperasi
                const kas = yield tx.kasKoperasi.findFirst();
                if (!kas || kas.saldo < pinjaman.nominalCair) {
                    throw new Error('Saldo kas koperasi tidak mencukupi untuk pencairan pinjaman ini');
                }
                // Potong kas
                const saldoBaru = kas.saldo - pinjaman.nominalCair;
                yield tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: saldoBaru } });
                yield tx.jurnalUmum.create({
                    data: {
                        keterangan: `Pencairan Pinjaman (ID: ${pinjaman.id}) a/n Anggota ${pinjaman.anggotaId}. Nominal: ${pinjaman.nominal}, Potongan Admin: ${pinjaman.biayaAdmin}, Potongan Asuransi: ${pinjaman.biayaAsuransi}`,
                        jenis: 'KREDIT',
                        nominal: pinjaman.nominalCair,
                        saldoSetelahnya: saldoBaru,
                        referensiId: String(pinjaman.id),
                        tipeReferensi: 'PINJAMAN'
                    }
                });
                // Generate Angsuran (Skema Flat)
                const pokok = pinjaman.nominal / pinjaman.tenor;
                const bunga = pinjaman.nominal * (pinjaman.bungaPersen / 100);
                const tagihan = pokok + bunga;
                let angsuranData = [];
                let date = new Date();
                for (let i = 1; i <= pinjaman.tenor; i++) {
                    let jatuhTempo = new Date(date.setMonth(date.getMonth() + 1));
                    angsuranData.push({
                        pinjamanId: pinjaman.id,
                        bulanKe: i,
                        nominalPokok: pokok,
                        nominalBunga: bunga,
                        totalTagihan: tagihan,
                        jatuhTempo: jatuhTempo,
                        status: 'BELUM_BAYAR'
                    });
                }
                yield tx.angsuran.createMany({ data: angsuranData });
            }
            return updated;
        }));
        res.json({ message: 'Status berhasil diupdate', data: updatedPinjaman });
    }
    catch (error) {
        console.error('Error updating status pinjaman:', error);
        res.status(500).json({ error: error.message || 'Gagal memperbarui status pinjaman' });
    }
}));
// DELETE pinjaman
router.delete('/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        // Pastikan pinjaman belum dicairkan
        const pinjaman = yield prisma_1.default.pinjaman.findUnique({ where: { id } });
        if (!pinjaman)
            return res.status(404).json({ error: 'Pinjaman tidak ditemukan' });
        if (pinjaman.status === 'DICAIRKAN' || pinjaman.status === 'LUNAS') {
            return res.status(400).json({ error: 'Pinjaman yang sudah dicairkan tidak dapat dihapus' });
        }
        // Hapus angsuran yang mungkin sudah terbuat
        yield prisma_1.default.angsuran.deleteMany({ where: { pinjamanId: id } });
        yield prisma_1.default.pinjaman.delete({ where: { id } });
        res.json({ message: 'Pinjaman berhasil dihapus' });
    }
    catch (error) {
        console.error('Error deleting pinjaman:', error);
        res.status(500).json({ error: 'Gagal menghapus pinjaman' });
    }
}));
exports.default = router;
