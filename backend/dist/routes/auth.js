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
// Trigger IDE Cache Refresh
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
    const { nip, password, fcmToken, deviceId, deviceName } = req.body;
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
        // Device Binding Logic
        if (deviceId) {
            if (!anggota.deviceId) {
                // First time login -> Bind device
                yield prisma.anggota.update({
                    where: { id: anggota.id },
                    data: { deviceId, deviceName, fcmToken: fcmToken || anggota.fcmToken }
                });
            }
            else if (anggota.deviceId !== deviceId) {
                // Login from another device -> Reject
                return res.status(403).json({ error: 'Perangkat tidak dikenali. Hubungi Admin untuk reset perangkat jika Anda menggunakan perangkat baru.' });
            }
            else if (fcmToken) {
                // Update FCM token only
                yield prisma.anggota.update({
                    where: { id: anggota.id },
                    data: { fcmToken }
                });
            }
        }
        else if (fcmToken) {
            // Fallback if deviceId not sent by old app version
            yield prisma.anggota.update({
                where: { id: anggota.id },
                data: { fcmToken }
            });
        }
        const token = jsonwebtoken_1.default.sign({ id: anggota.id, role: 'ANGGOTA', nip: anggota.nip }, JWT_SECRET, { expiresIn: '30d' } // Mobile app usually has longer sessions
        );
        const isDefaultPassword = password === 'Bakamla123!';
        return res.json({ message: 'Login berhasil', token, user: anggota, isDefaultPassword });
    }
    catch (error) {
        console.error('Mobile Login error:', error);
        res.status(500).json({ error: 'Terjadi kesalahan pada server' });
    }
}));
// Register Route (Mobile App)
router.post('/register-mobile', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { nip, namaLengkap, email, password } = req.body;
    try {
        // Validasi
        if (!nip || nip.length < 6) {
            return res.status(400).json({ error: 'NIP harus memiliki minimal 6 digit' });
        }
        if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            return res.status(400).json({ error: 'Format email tidak valid' });
        }
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (!password || !passwordRegex.test(password)) {
            return res.status(400).json({ error: 'Password harus minimal 8 karakter dan mengandung huruf besar, huruf kecil, angka, dan karakter khusus.' });
        }
        // Check if NIP already exists
        const existing = yield prisma.anggota.findUnique({ where: { nip } });
        if (existing) {
            return res.status(400).json({ error: 'NIP sudah terdaftar' });
        }
        const hashedPassword = yield bcrypt_1.default.hash(password, 10);
        const anggota = yield prisma.anggota.create({
            data: {
                nip,
                namaLengkap,
                email,
                password: hashedPassword,
                status: 'MENUNGGU_PERSETUJUAN'
            }
        });
        return res.json({ message: 'Pendaftaran berhasil. Silakan tunggu persetujuan Admin.', user: anggota });
    }
    catch (error) {
        console.error('Mobile Register error:', error);
        res.status(500).json({ error: 'Terjadi kesalahan pada server' });
    }
}));
// Forgot PIN - OTP Simulation
router.post('/forgot-pin/otp', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { nip, email } = req.body;
    try {
        const anggota = yield prisma.anggota.findUnique({ where: { nip } });
        if (!anggota || anggota.email !== email) {
            return res.status(400).json({ error: 'Data NIP atau Email tidak cocok' });
        }
        // In a real app, generate OTP and send via NodeMailer here.
        // For now, simulate success and assume OTP is '1234'
        return res.json({ message: 'OTP berhasil dikirim ke email Anda.' });
    }
    catch (error) {
        console.error('Forgot PIN OTP error:', error);
        res.status(500).json({ error: 'Terjadi kesalahan pada server' });
    }
}));
// Forgot PIN - Admin Ticket via Chat
router.post('/forgot-pin/ticket', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { nip, email } = req.body;
    try {
        const anggota = yield prisma.anggota.findUnique({ where: { nip } });
        if (!anggota) {
            return res.status(400).json({ error: 'NIP tidak ditemukan' });
        }
        // Buat tiket chat ke admin
        yield prisma.chat.create({
            data: {
                pengirimId: 'system',
                penerimaId: 'admin',
                pesan: `TICKET LUPA PIN: Anggota NIP ${nip} (${anggota.namaLengkap}) memohon reset PIN. Email terdaftar: ${email}. Harap segera diproses.`,
                isRead: false
            }
        });
        return res.json({ message: 'Permohonan reset PIN telah dikirim ke Admin. Silakan tunggu dihubungi.' });
    }
    catch (error) {
        console.error('Forgot PIN Ticket error:', error);
        res.status(500).json({ error: 'Terjadi kesalahan pada server' });
    }
}));
// Reset PIN (After OTP success)
router.post('/reset-pin', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { nip, otp, newPassword } = req.body;
    try {
        // Validate OTP (simulated to '1234')
        if (otp !== '1234') {
            return res.status(400).json({ error: 'OTP salah' });
        }
        const anggota = yield prisma.anggota.findUnique({ where: { nip } });
        if (!anggota) {
            return res.status(400).json({ error: 'NIP tidak ditemukan' });
        }
        const hashedPassword = yield bcrypt_1.default.hash(newPassword, 10);
        yield prisma.anggota.update({
            where: { id: anggota.id },
            data: { password: hashedPassword }
        });
        return res.json({ message: 'PIN berhasil diubah. Silakan login kembali.' });
    }
    catch (error) {
        console.error('Reset PIN error:', error);
        res.status(500).json({ error: 'Terjadi kesalahan pada server' });
    }
}));
// GET /me (Get Admin Profile)
router.get('/me', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const authHeader = req.headers.authorization;
        if (!authHeader)
            return res.status(401).json({ error: 'Token tidak ditemukan' });
        const token = authHeader.split(' ')[1];
        const decoded = jsonwebtoken_1.default.verify(token, JWT_SECRET);
        const user = yield prisma.user.findUnique({
            where: { id: decoded.id },
            select: { id: true, username: true, name: true, role: true, createdAt: true }
        });
        if (!user)
            return res.status(404).json({ error: 'User tidak ditemukan' });
        res.json(user);
    }
    catch (error) {
        res.status(401).json({ error: 'Sesi tidak valid' });
    }
}));
// PUT /me (Update Admin Profile)
router.put('/me', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const authHeader = req.headers.authorization;
        if (!authHeader)
            return res.status(401).json({ error: 'Token tidak ditemukan' });
        const token = authHeader.split(' ')[1];
        const decoded = jsonwebtoken_1.default.verify(token, JWT_SECRET);
        const { name, currentPassword, newPassword } = req.body;
        const user = yield prisma.user.findUnique({ where: { id: decoded.id } });
        if (!user)
            return res.status(404).json({ error: 'User tidak ditemukan' });
        let updatedData = {};
        if (name)
            updatedData.name = name;
        if (newPassword && currentPassword) {
            const isMatch = yield bcrypt_1.default.compare(currentPassword, user.password);
            if (!isMatch)
                return res.status(400).json({ error: 'Password saat ini salah' });
            updatedData.password = yield bcrypt_1.default.hash(newPassword, 10);
        }
        const updatedUser = yield prisma.user.update({
            where: { id: decoded.id },
            data: updatedData,
            select: { id: true, username: true, name: true, role: true }
        });
        res.json({ message: 'Profil berhasil diupdate', data: updatedUser });
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal mengupdate profil' });
    }
}));
exports.default = router;
