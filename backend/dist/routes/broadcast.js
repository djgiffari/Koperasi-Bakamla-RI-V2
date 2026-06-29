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
const audit_1 = require("../utils/audit");
const router = (0, express_1.Router)();
// GET broadcast history
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const history = yield prisma_1.default.$queryRawUnsafe(`
      SELECT judul, pesan, "createdAt", COUNT(id) as terkirim 
      FROM "Notifikasi" 
      GROUP BY judul, pesan, "createdAt" 
      ORDER BY "createdAt" DESC
    `);
        res.json(history);
    }
    catch (error) {
        console.error('Error fetching broadcast history:', error);
        res.status(500).json({ error: 'Gagal mengambil riwayat siaran' });
    }
}));
// POST send broadcast message
router.post('/', (0, audit_1.auditLog)('SEND_BROADCAST', 'Chat'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { title, message } = req.body;
        if (!title || !message) {
            return res.status(400).json({ error: 'Judul dan isi pesan wajib diisi' });
        }
        const semuaAnggota = yield prisma_1.default.anggota.findMany({ where: { status: 'AKTIF' }, select: { id: true } });
        // Save to Notifikasi instead of Chat
        // Use an exact timestamp so we can group them as a single broadcast
        const exactTimestamp = new Date();
        for (const a of semuaAnggota) {
            yield prisma_1.default.$executeRawUnsafe('INSERT INTO "Notifikasi" ("anggotaId", judul, pesan, "isRead", "createdAt") VALUES ($1, $2, $3, false, $4)', a.id, title, message, exactTimestamp);
        }
        res.status(201).json({ message: 'Pesan siaran berhasil dikirim ke seluruh anggota aktif' });
    }
    catch (error) {
        console.error('Error sending broadcast:', error);
        res.status(500).json({ error: 'Gagal mengirim pesan siaran' });
    }
}));
// DELETE broadcast
router.delete('/', (0, audit_1.auditLog)('DELETE_BROADCAST', 'Notifikasi'), (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { createdAt, judul } = req.body;
        if (!createdAt || !judul) {
            return res.status(400).json({ error: 'Data broadcast tidak lengkap' });
        }
        const date = new Date(createdAt);
        yield prisma_1.default.$executeRawUnsafe('DELETE FROM "Notifikasi" WHERE "createdAt" = $1 AND judul = $2', date, judul);
        res.json({ message: 'Riwayat broadcast berhasil dihapus' });
    }
    catch (error) {
        console.error('Error deleting broadcast:', error);
        res.status(500).json({ error: 'Gagal menghapus broadcast' });
    }
}));
exports.default = router;
