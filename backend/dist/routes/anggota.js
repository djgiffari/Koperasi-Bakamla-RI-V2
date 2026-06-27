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
const bcrypt_1 = __importDefault(require("bcrypt"));
const router = (0, express_1.Router)();
// Configure multer storage
const storage = multer_1.default.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, 'sk-' + uniqueSuffix + path_1.default.extname(file.originalname));
    }
});
const upload = (0, multer_1.default)({ storage: storage });
// GET all anggota
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggota = yield prisma_1.default.anggota.findMany({
            orderBy: { createdAt: 'desc' }
        });
        res.json(anggota);
    }
    catch (error) {
        console.error('Error fetching anggota:', error);
        res.status(500).json({ error: 'Gagal mengambil data anggota' });
    }
}));
// POST new anggota (Admin side)
router.post('/', upload.single('fcSkFile'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { namaLengkap, nip, pangkat, unitKerja, tempatLahir, tanggalLahir, alamatKantor, noKtp, alamatRumah, noRekening, fcSkStatus, password } = req.body;
        let fcSkUrl = null;
        if (req.file) {
            fcSkUrl = `/uploads/${req.file.filename}`;
        }
        let hashedPassword = null;
        if (password) {
            hashedPassword = yield bcrypt_1.default.hash(password, 10);
        }
        const newAnggota = yield prisma_1.default.anggota.create({
            data: {
                namaLengkap,
                nip,
                pangkat,
                unitKerja,
                tempatLahir,
                tanggalLahir: tanggalLahir ? new Date(tanggalLahir) : null,
                alamatKantor,
                noKtp,
                alamatRumah,
                noRekening,
                fcSkStatus: fcSkStatus || 'belum',
                fcSkUrl,
                password: hashedPassword,
                status: 'AKTIF'
            }
        });
        res.status(201).json(newAnggota);
    }
    catch (error) {
        console.error('Error creating anggota:', error);
        res.status(500).json({ error: 'Gagal menambahkan data anggota' });
    }
}));
// POST register (Mobile Self-Registration)
router.post('/register', upload.single('ktpFile'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { namaLengkap, nip, password, noKtp, unitKerja, noHp } = req.body;
        // Check if NIP already exists
        const existing = yield prisma_1.default.anggota.findUnique({ where: { nip } });
        if (existing) {
            return res.status(400).json({ error: 'NIP sudah terdaftar.' });
        }
        let ktpUrl = null;
        if (req.file) {
            ktpUrl = `/uploads/${req.file.filename}`;
        }
        const hashedPassword = yield bcrypt_1.default.hash(password, 10);
        const newAnggota = yield prisma_1.default.anggota.create({
            data: {
                namaLengkap,
                nip,
                password: hashedPassword,
                noKtp,
                unitKerja,
                noHp,
                fcSkUrl: ktpUrl, // using fcSkUrl field to store ID/KTP for now
                status: 'MENUNGGU_PERSETUJUAN' // Requires admin approval
            }
        });
        res.status(201).json({ message: 'Registrasi berhasil, menunggu persetujuan admin', data: newAnggota });
    }
    catch (error) {
        console.error('Error registering mobile anggota:', error);
        res.status(500).json({ error: 'Gagal mendaftar keanggotaan' });
    }
}));
// PUT update anggota
router.put('/:id', upload.single('fcSkFile'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { namaLengkap, nip, pangkat, unitKerja, tempatLahir, tanggalLahir, alamatKantor, noKtp, alamatRumah, noRekening, fcSkStatus } = req.body;
        let updateData = {
            namaLengkap,
            nip,
            pangkat,
            unitKerja,
            tempatLahir,
            tanggalLahir: tanggalLahir ? new Date(tanggalLahir) : null,
            alamatKantor,
            noKtp,
            alamatRumah,
            noRekening,
            fcSkStatus
        };
        if (req.file) {
            updateData.fcSkUrl = `/uploads/${req.file.filename}`;
        }
        const updatedAnggota = yield prisma_1.default.anggota.update({
            where: { id },
            data: updateData
        });
        res.json(updatedAnggota);
    }
    catch (error) {
        console.error('Error updating anggota:', error);
        res.status(500).json({ error: 'Gagal memperbarui data anggota' });
    }
}));
// DELETE anggota
router.delete('/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        yield prisma_1.default.anggota.delete({
            where: { id }
        });
        res.json({ message: 'Anggota berhasil dihapus' });
    }
    catch (error) {
        console.error('Error deleting anggota:', error);
        res.status(500).json({ error: 'Gagal menghapus data anggota' });
    }
}));
exports.default = router;
