"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.authenticateToken = void 0;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const JWT_SECRET = process.env.JWT_SECRET || 'secret_key_koperasi_bakamla_v2';
const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    // Token is usually sent as "Bearer <token>"
    const token = authHeader && authHeader.split(' ')[1];
    if (!token) {
        return res.status(401).json({ error: 'Akses ditolak. Token tidak disediakan.' });
    }
    jsonwebtoken_1.default.verify(token, JWT_SECRET, (err, user) => {
        if (err) {
            return res.status(403).json({ error: 'Sesi tidak valid atau telah kedaluwarsa. Silakan login kembali.' });
        }
        req.user = user;
        next();
    });
};
exports.authenticateToken = authenticateToken;
