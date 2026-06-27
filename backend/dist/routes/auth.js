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
// import { PrismaClient } from '@prisma/client';
const router = (0, express_1.Router)();
// const prisma = new PrismaClient();
const JWT_SECRET = process.env.JWT_SECRET || 'secret_key_koperasi_bakamla_v2';
// Login Route
router.post('/login', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { username, password } = req.body;
    try {
        // For now, we will use a dummy admin check until Prisma schema is fully ready and migrated.
        if (username === 'admin' && password === 'admin123') {
            const token = jsonwebtoken_1.default.sign({ id: 1, role: 'ADMIN', username: 'admin' }, JWT_SECRET, { expiresIn: '1d' });
            // Send token and basic user info
            return res.json({
                message: 'Login berhasil',
                token,
                user: { id: 1, username: 'admin', role: 'ADMIN', name: 'Administrator' }
            });
        }
        // Example of actual DB check once schema is generated:
        /*
        const user = await prisma.user.findUnique({ where: { username } });
        if (!user) {
          return res.status(401).json({ error: 'Username atau password salah' });
        }
        const isPasswordValid = await bcrypt.compare(password, user.password);
        if (!isPasswordValid) {
          return res.status(401).json({ error: 'Username atau password salah' });
        }
        const token = jwt.sign(
          { id: user.id, role: user.role, username: user.username },
          JWT_SECRET,
          { expiresIn: '1d' }
        );
        return res.json({ message: 'Login berhasil', token, user });
        */
        return res.status(401).json({ error: 'Username atau password salah' });
    }
    catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ error: 'Terjadi kesalahan pada server' });
    }
}));
exports.default = router;
