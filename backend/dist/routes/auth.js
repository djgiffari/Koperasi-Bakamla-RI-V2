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
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const bcrypt_1 = __importDefault(require("bcrypt"));
const client_1 = require("@prisma/client");
const router = (0, express_1.Router)();
const prisma = new client_1.PrismaClient();
const JWT_SECRET = process.env.JWT_SECRET || 'secret_key_koperasi_bakamla_v2';
// Login Route (Web Admin)
router.post('/login', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { username, password } = req.body;
    try {
        const user = yield prisma.user.findUnique({ where: { username } });
        if (!user) {
            return res.status(401).json({ error: 'Username atau password salah' });
        }
        const isPasswordValid = yield bcrypt_1.default.compare(password, user.password);
        if (!isPasswordValid) {
            return res.status(401).json({ error: 'Username atau password salah' });
        }
        const token = jsonwebtoken_1.default.sign({ id: user.id, role: user.role, username: user.username }, JWT_SECRET, { expiresIn: '1d' });
        return res.json({ message: 'Login berhasil', token, user });
    }
    catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ error: 'Terjadi kesalahan pada server' });
    }
}));
// Login Route (Mobile App / Anggota)
router.post('/login-mobile', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { nip, password, fcmToken } = req.body;
    try {
        const anggota = yield prisma.anggota.findUnique({ where: { nip } });
        if (!anggota) {
            return res.status(401).json({ error: 'NIP tidak terdaftar' });
        }
        // Check if password exists (some members might not be activated yet)
        if (!anggota.password) {
            return res.status(403).json({ error: 'Akun belum diaktifkan. Silakan hubungi admin.' });
        }
        const isPasswordValid = yield bcrypt_1.default.compare(password, anggota.password);
        if (!isPasswordValid) {
            return res.status(401).json({ error: 'Password salah' });
        }
        if (anggota.status !== 'AKTIF') {
            return res.status(403).json({ error: `Akun anda ${anggota.status}. Tidak dapat login.` });
        }
        // Update FCM token if provided
        if (fcmToken) {
            yield prisma.anggota.update({
                where: { id: anggota.id },
                data: { fcmToken }
            });
        }
        const token = jsonwebtoken_1.default.sign({ id: anggota.id, role: 'ANGGOTA', nip: anggota.nip }, JWT_SECRET, { expiresIn: '30d' } // Mobile app usually has longer sessions
        );
        return res.json({ message: 'Login berhasil', token, user: anggota });
    }
    catch (error) {
        console.error('Mobile Login error:', error);
        res.status(500).json({ error: 'Terjadi kesalahan pada server' });
    }
}));
exports.default = router;
