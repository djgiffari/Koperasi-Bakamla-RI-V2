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
// GET all simpanan
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const simpanan = yield prisma_1.default.simpanan.findMany({
            include: {
                anggota: true
            },
            orderBy: { createdAt: 'desc' }
        });
        res.json(simpanan);
    }
    catch (error) {
        console.error('Error fetching simpanan:', error);
        res.status(500).json({ error: 'Gagal mengambil data simpanan' });
    }
}));
// Helper to generate Invoice Code
function generateInvoiceCode() {
    return __awaiter(this, void 0, void 0, function* () {
        const date = new Date();
        const yyyy = date.getFullYear();
        const mm = String(date.getMonth() + 1).padStart(2, '0');
        const prefix = `SA-${yyyy}${mm}-`;
        const lastSimpanan = yield prisma_1.default.simpanan.findFirst({
            where: {
                kodeInvoice: {
                    startsWith: prefix
                }
            },
            orderBy: {
                id: 'desc'
            }
        });
        let seq = 1;
        if (lastSimpanan && lastSimpanan.kodeInvoice) {
            const lastSeqStr = lastSimpanan.kodeInvoice.replace(prefix, '');
            const lastSeq = parseInt(lastSeqStr, 10);
            if (!isNaN(lastSeq)) {
                seq = lastSeq + 1;
            }
        }
        const seqStr = String(seq).padStart(3, '0');
        return `${prefix}${seqStr}`;
    });
}
// POST new simpanan
router.post('/', upload.single('buktiFile'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, jenisSimpanan, saldo, kodeAkun, tanggal } = req.body;
        let buktiUrl = null;
        if (req.file) {
            buktiUrl = `/uploads/${req.file.filename}`;
        }
        const kodeInvoice = yield generateInvoiceCode();
        const newSimpanan = yield prisma_1.default.simpanan.create({
            data: {
                anggotaId: parseInt(anggotaId),
                jenisSimpanan: jenisSimpanan,
                saldo: parseFloat(saldo),
                kodeAkun: kodeAkun || null,
                kodeInvoice: kodeInvoice,
                buktiUrl: buktiUrl,
                status: 'MENUNGGU_PERSETUJUAN',
                createdAt: tanggal ? new Date(tanggal) : new Date()
            },
            include: {
                anggota: true
            }
        });
        res.status(201).json(newSimpanan);
    }
    catch (error) {
        console.error('Error creating simpanan:', error);
        res.status(500).json({ error: 'Gagal menambahkan data simpanan' });
    }
}));
// PUT update simpanan status
router.put('/:id/status', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { status } = req.body;
        if (!['MENUNGGU_PERSETUJUAN', 'DISETUJUI', 'DITOLAK'].includes(status)) {
            return res.status(400).json({ error: 'Status tidak valid' });
        }
        const updatedSimpanan = yield prisma_1.default.simpanan.update({
            where: { id },
            data: { status }
        });
        res.json(updatedSimpanan);
    }
    catch (error) {
        console.error('Error updating status:', error);
        res.status(500).json({ error: 'Gagal mengubah status' });
    }
}));
// DELETE simpanan
router.delete('/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        yield prisma_1.default.simpanan.delete({
            where: { id }
        });
        res.json({ message: 'Simpanan berhasil dihapus' });
    }
    catch (error) {
        console.error('Error deleting simpanan:', error);
        res.status(500).json({ error: 'Gagal menghapus data simpanan' });
    }
}));
exports.default = router;
