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
// GET all contacts (Anggota yang memiliki riwayat chat, atau semua anggota jika ingin memulai obrolan)
// Untuk Admin, kita ingin melihat semua anggota, dengan jumlah pesan belum terbaca dan pesan terakhir.
router.get('/contacts', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        // Ambil user ID yang punya riwayat chat dengan admin
        const chats = yield prisma_1.default.chat.findMany({
            where: { OR: [{ pengirimId: 'admin' }, { penerimaId: 'admin' }] },
            select: { pengirimId: true, penerimaId: true }
        });
        const userIds = new Set();
        chats.forEach(c => {
            if (c.pengirimId !== 'admin') {
                const id = parseInt(c.pengirimId);
                if (!isNaN(id))
                    userIds.add(id);
            }
            if (c.penerimaId !== 'admin') {
                const id = parseInt(c.penerimaId);
                if (!isNaN(id))
                    userIds.add(id);
            }
        });
        const anggotaList = yield prisma_1.default.anggota.findMany({
            where: { id: { in: Array.from(userIds) }, status: 'AKTIF' },
            select: { id: true, namaLengkap: true, nip: true, fotoProfilUrl: true }
        });
        const contacts = yield Promise.all(anggotaList.map((anggota) => __awaiter(void 0, void 0, void 0, function* () {
            // Ambil pesan terakhir antara admin dan anggota
            const strId = String(anggota.id);
            const lastChat = yield prisma_1.default.chat.findFirst({
                where: {
                    OR: [
                        { pengirimId: 'admin', penerimaId: strId },
                        { pengirimId: strId, penerimaId: 'admin' }
                    ]
                },
                orderBy: { createdAt: 'desc' }
            });
            // Hitung pesan yang belum terbaca oleh admin
            const unreadCount = yield prisma_1.default.chat.count({
                where: {
                    pengirimId: strId,
                    penerimaId: 'admin',
                    isRead: false
                }
            });
            return {
                id: anggota.id,
                name: anggota.namaLengkap,
                nip: anggota.nip,
                lastMessage: lastChat ? lastChat.pesan : '',
                time: lastChat ? lastChat.createdAt : null,
                unread: unreadCount,
                online: false // Ini bisa dikembangkan dengan Socket.IO di memori, untuk saat ini false
            };
        })));
        // Urutkan berdasarkan waktu pesan terakhir
        contacts.sort((a, b) => {
            if (!a.time)
                return 1;
            if (!b.time)
                return -1;
            return new Date(b.time).getTime() - new Date(a.time).getTime();
        });
        res.json(contacts);
    }
    catch (error) {
        console.error('Error fetching chat contacts:', error);
        res.status(500).json({ error: 'Gagal mengambil kontak' });
    }
}));
// GET jumlah chat yang belum terbaca oleh admin (dari seluruh anggota)
router.get('/unread-count', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const count = yield prisma_1.default.chat.count({
            where: {
                penerimaId: 'admin',
                isRead: false
            }
        });
        res.json({ count });
    }
    catch (error) {
        console.error('Error fetching unread count:', error);
        res.status(500).json({ error: 'Gagal mengambil jumlah pesan belum terbaca' });
    }
}));
// GET riwayat pesan spesifik untuk satu user
router.get('/:userId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const userId = req.params.userId; // userId dari anggota
        // Kita asumsikan endpoint ini dipanggil dari admin (penerimaId = admin, atau pengirimId = admin)
        // Atau dipanggil dari mobile app (penerimaId = userId, pengirimId = admin)
        const chats = yield prisma_1.default.chat.findMany({
            where: {
                OR: [
                    { pengirimId: 'admin', penerimaId: userId },
                    { pengirimId: userId, penerimaId: 'admin' }
                ]
            },
            orderBy: { createdAt: 'asc' }
        });
        // Tandai semua pesan masuk dari user ini ke admin sebagai sudah terbaca jika dipanggil admin
        // Untuk fitur lebih kompleks, harusnya via role
        yield prisma_1.default.chat.updateMany({
            where: { pengirimId: userId, penerimaId: 'admin', isRead: false },
            data: { isRead: true }
        });
        res.json(chats);
    }
    catch (error) {
        console.error('Error fetching chat history:', error);
        res.status(500).json({ error: 'Gagal mengambil riwayat pesan' });
    }
}));
// POST send message
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { pengirimId, penerimaId, pesan } = req.body;
        const newChat = yield prisma_1.default.chat.create({
            data: {
                pengirimId: String(pengirimId),
                penerimaId: String(penerimaId),
                pesan
            }
        });
        // Emit realtime event via Socket.io
        const io = req.app.get('io');
        if (io) {
            io.to(String(penerimaId)).emit('receive_message', newChat);
            // Juga kirim kembali ke pengirim jika mereka terhubung dari device lain
            io.to(String(pengirimId)).emit('message_sent', newChat);
        }
        res.status(201).json(newChat);
    }
    catch (error) {
        console.error('Error sending message:', error);
        res.status(500).json({ error: 'Gagal mengirim pesan' });
    }
}));
// PUT tandai pesan terbaca
router.put('/read/:messageId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const messageId = req.params.messageId;
        yield prisma_1.default.chat.update({
            where: { id: parseInt(messageId) },
            data: { isRead: true }
        });
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ error: 'Gagal' });
    }
}));
exports.default = router;
