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
// Trigger IDE Cache Refresh
const client_1 = require("@prisma/client");
const multer_1 = __importDefault(require("multer"));
const path_1 = __importDefault(require("path"));
const auth_1 = require("../middleware/auth");
const router = express_1.default.Router();
const prisma = new client_1.PrismaClient();
const storage = multer_1.default.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, 'pengaduan-' + uniqueSuffix + path_1.default.extname(file.originalname));
    }
});
const upload = (0, multer_1.default)({ storage: storage });
// ==========================================
// MOBILE ENDPOINTS
// ==========================================
// Create new Pengaduan
router.post('/', auth_1.authenticateToken, upload.single('lampiranFile'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, kategori, subjek, deskripsi } = req.body;
        if (!anggotaId || !kategori || !subjek || !deskripsi) {
            return res.status(400).json({ error: 'Data tidak lengkap' });
        }
        const fileUrl = req.file ? `/uploads/${req.file.filename}` : null;
        let validAnggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(anggotaId);
        const anggotaExist = yield prisma.anggota.findUnique({ where: { id: validAnggotaId } });
        if (!anggotaExist) {
            return res.status(404).json({ error: 'Data anggota tidak ditemukan' });
        }
        const pengaduan = yield prisma.pengaduan.create({
            data: {
                anggotaId: validAnggotaId,
                kategori,
                subjek,
                deskripsi,
                lampiranUrl: fileUrl,
            }
        });
        res.json({ message: 'Pengaduan berhasil dikirim', pengaduan });
    }
    catch (error) {
        console.error('Error creating pengaduan:', error);
        res.status(500).json({ error: 'Gagal mengirim pengaduan' });
    }
}));
// Get user's Pengaduan history
router.get('/mobile/:anggotaId', auth_1.authenticateToken, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = req.user.role === 'ANGGOTA' ? req.user.id : parseInt(req.params.anggotaId);
        const riwayat = yield prisma.pengaduan.findMany({
            where: { anggotaId },
            orderBy: { createdAt: 'desc' }
        });
        res.json(riwayat);
    }
    catch (error) {
        console.error('Error fetching pengaduan:', error);
        res.status(500).json({ error: 'Gagal memuat riwayat pengaduan' });
    }
}));
// ==========================================
// ADMIN ENDPOINTS
// ==========================================
// Get all Pengaduan
router.get('/admin', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const pengaduan = yield prisma.pengaduan.findMany({
            include: {
                anggota: {
                    select: { namaLengkap: true, nip: true, pangkat: true, unitKerja: true }
                }
            },
            orderBy: { createdAt: 'desc' }
        });
        res.json(pengaduan);
    }
    catch (error) {
        console.error('Error fetching all pengaduan:', error);
        res.status(500).json({ error: 'Gagal memuat data pengaduan' });
    }
}));
// Update status / reply Pengaduan
router.put('/admin/:id/status', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { id } = req.params;
        const { status, balasanAdmin } = req.body;
        const updated = yield prisma.pengaduan.update({
            where: { id: parseInt(id) },
            data: {
                status,
                balasanAdmin: balasanAdmin !== undefined ? balasanAdmin : undefined
            }
        });
        res.json({ message: 'Status berhasil diperbarui', updated });
    }
    catch (error) {
        console.error('Error updating pengaduan:', error);
        res.status(500).json({ error: 'Gagal memperbarui pengaduan' });
    }
}));
exports.default = router;
