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
const router = (0, express_1.Router)();
// GET /unread/:anggotaId - get unread count
router.get('/unread/:anggotaId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    try {
        const anggotaId = parseInt(req.params.anggotaId);
        // We use executeRaw because Prisma Client might not be fully generated yet for Notifikasi
        const result = yield prisma_1.default.$queryRawUnsafe(`SELECT COUNT(*) as count FROM "Notifikasi" WHERE "anggotaId" = $1 AND "isRead" = false`, anggotaId);
        const count = Number(((_a = result[0]) === null || _a === void 0 ? void 0 : _a.count) || 0);
        res.json({ count });
    }
    catch (error) {
        console.error('Error fetching unread notifikasi count:', error);
        res.status(500).json({ error: 'Gagal mengambil jumlah notifikasi belum terbaca' });
    }
}));
// GET /:anggotaId - get list
router.get('/:anggotaId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = parseInt(req.params.anggotaId);
        const result = yield prisma_1.default.$queryRawUnsafe(`SELECT * FROM "Notifikasi" WHERE "anggotaId" = $1 ORDER BY "createdAt" DESC LIMIT 100`, anggotaId);
        res.json(result);
    }
    catch (error) {
        console.error('Error fetching notifikasi:', error);
        res.status(500).json({ error: 'Gagal mengambil daftar notifikasi' });
    }
}));
// PUT /:id/read - mark single as read
router.put('/:id/read', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        yield prisma_1.default.$executeRawUnsafe(`UPDATE "Notifikasi" SET "isRead" = true WHERE id = $1`, id);
        res.json({ message: 'Notifikasi ditandai sudah dibaca' });
    }
    catch (error) {
        console.error('Error marking notifikasi read:', error);
        res.status(500).json({ error: 'Gagal menandai notifikasi' });
    }
}));
// PUT /read-all/:anggotaId - mark all as read
router.put('/read-all/:anggotaId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const anggotaId = parseInt(req.params.anggotaId);
        yield prisma_1.default.$executeRawUnsafe(`UPDATE "Notifikasi" SET "isRead" = true WHERE "anggotaId" = $1`, anggotaId);
        res.json({ message: 'Semua notifikasi ditandai sudah dibaca' });
    }
    catch (error) {
        console.error('Error marking all notifikasi read:', error);
        res.status(500).json({ error: 'Gagal menandai semua notifikasi' });
    }
}));
exports.default = router;
