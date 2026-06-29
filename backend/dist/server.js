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
const cors_1 = __importDefault(require("cors"));
const helmet_1 = __importDefault(require("helmet"));
const morgan_1 = __importDefault(require("morgan"));
const dotenv_1 = __importDefault(require("dotenv"));
const path_1 = __importDefault(require("path"));
const fs_1 = __importDefault(require("fs"));
const http_1 = require("http");
const socket_io_1 = require("socket.io");
// Routes
const auth_1 = __importDefault(require("./routes/auth"));
const anggota_1 = __importDefault(require("./routes/anggota"));
const simpanan_1 = __importDefault(require("./routes/simpanan"));
const pinjaman_1 = __importDefault(require("./routes/pinjaman"));
const angsuran_1 = __importDefault(require("./routes/angsuran"));
const dashboard_1 = __importDefault(require("./routes/dashboard"));
const pengaturan_1 = __importDefault(require("./routes/pengaturan"));
const toko_1 = __importDefault(require("./routes/toko"));
const shu_1 = __importDefault(require("./routes/shu"));
const chat_1 = __importDefault(require("./routes/chat"));
const users_1 = __importDefault(require("./routes/users"));
const laporan_1 = __importDefault(require("./routes/laporan"));
const logs_1 = __importDefault(require("./routes/logs"));
const broadcast_1 = __importDefault(require("./routes/broadcast"));
const notifikasi_1 = __importDefault(require("./routes/notifikasi"));
const pengaduan_1 = __importDefault(require("./routes/pengaduan"));
const transaksi_1 = __importDefault(require("./routes/transaksi"));
const prisma_1 = __importDefault(require("./utils/prisma"));
const scheduler_1 = require("./utils/scheduler");
dotenv_1.default.config();
// Start Background Jobs
(0, scheduler_1.startScheduler)();
const app = (0, express_1.default)();
const PORT = process.env.PORT || 3000;
// Create HTTP Server and bind Socket.io
const httpServer = (0, http_1.createServer)(app);
const io = new socket_io_1.Server(httpServer, {
    cors: {
        origin: '*',
        methods: ['GET', 'POST']
    }
});
app.set('io', io);
// Middleware
app.use(express_1.default.json());
app.use((0, cors_1.default)());
app.use((0, helmet_1.default)());
app.use((0, morgan_1.default)('dev'));
// Setup uploads folder
const uploadDir = path_1.default.join(process.cwd(), 'uploads');
if (!fs_1.default.existsSync(uploadDir)) {
    fs_1.default.mkdirSync(uploadDir, { recursive: true });
}
app.use('/uploads', express_1.default.static(uploadDir));
// Rest API Routes
app.use('/api/auth', auth_1.default);
app.use('/api/users', users_1.default);
app.use('/api/anggota', anggota_1.default);
app.use('/api/simpanan', simpanan_1.default);
app.use('/api/pinjaman', pinjaman_1.default);
app.use('/api/angsuran', angsuran_1.default);
app.use('/api/dashboard', dashboard_1.default);
app.use('/api/pengaturan', pengaturan_1.default);
app.use('/api/toko', toko_1.default);
app.use('/api/shu', shu_1.default);
app.use('/api/chat', chat_1.default);
app.use('/api/laporan', laporan_1.default);
app.use('/api/logs', logs_1.default);
app.use('/api/broadcast', broadcast_1.default);
app.use('/api/notifikasi', notifikasi_1.default);
app.use('/api/pengaduan', pengaduan_1.default);
app.use('/api/transaksi', transaksi_1.default);
// Root route
app.get('/', (req, res) => {
    res.send('API Koperasi Bakamla RI v2');
});
// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ error: 'Terjadi kesalahan pada server.' });
});
// Socket.io Implementation
io.on('connection', (socket) => {
    console.log('User connected:', socket.id);
    // User bergabung ke room pribadi mereka menggunakan ID mereka sendiri
    // Admin bisa mendengarkan room tertentu atau broadcasting.
    socket.on('join', (userId) => {
        socket.join(userId);
        console.log(`User ${userId} joined their personal room`);
    });
    socket.on('send_message', (data) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            // 1. Simpan ke database
            const chat = yield prisma_1.default.chat.create({
                data: {
                    pengirimId: data.pengirimId,
                    penerimaId: data.penerimaId,
                    pesan: data.pesan,
                    isRead: false
                }
            });
            // 2. Kirim pesan secara realtime ke penerima
            io.to(data.penerimaId).emit('receive_message', chat);
            // 3. Kirim kembali ke pengirim (untuk update UI jika multi-device)
            socket.emit('message_sent', chat);
        }
        catch (error) {
            console.error('Socket send_message error:', error);
        }
    }));
    socket.on('disconnect', () => {
        console.log('User disconnected:', socket.id);
    });
});
httpServer.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
