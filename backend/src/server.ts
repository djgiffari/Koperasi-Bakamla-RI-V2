import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import dotenv from 'dotenv';
import path from 'path';
import fs from 'fs';
import { createServer } from 'http';
import { Server as SocketIOServer } from 'socket.io';

// Routes
import authRoutes from './routes/auth';
import anggotaRoutes from './routes/anggota';
import simpananRoutes from './routes/simpanan';
import pinjamanRoutes from './routes/pinjaman';
import angsuranRoutes from './routes/angsuran';
import dashboardRoutes from './routes/dashboard';
import pengaturanRoutes from './routes/pengaturan';
import tokoRoutes from './routes/toko';
import shuRoutes from './routes/shu';
import chatRoutes from './routes/chat';

import usersRoutes from './routes/users';
import laporanRoutes from './routes/laporan';
import logsRoutes from './routes/logs';

import broadcastRoutes from './routes/broadcast';
import notifikasiRoutes from './routes/notifikasi';
import pengaduanRoutes from './routes/pengaduan';
import transaksiRoutes from './routes/transaksi';

import prisma from './utils/prisma';
import { startScheduler } from './utils/scheduler';

dotenv.config();

// Start Background Jobs
startScheduler();

const app = express();
const PORT = process.env.PORT || 3000;

// Create HTTP Server and bind Socket.io
const httpServer = createServer(app);
const io = new SocketIOServer(httpServer, {
  cors: {
    origin: '*',
    methods: ['GET', 'POST']
  }
});
app.set('io', io);

// Middleware
app.use(express.json());
app.use(cors());
app.use(helmet());
app.use(morgan('dev'));

// Setup uploads folder
const uploadDir = path.join(process.cwd(), 'uploads');
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}
app.use('/uploads', express.static(uploadDir));

// Rest API Routes
app.use('/api/auth', authRoutes);
app.use('/api/users', usersRoutes);
app.use('/api/anggota', anggotaRoutes);
app.use('/api/simpanan', simpananRoutes);
app.use('/api/pinjaman', pinjamanRoutes);
app.use('/api/angsuran', angsuranRoutes);
app.use('/api/dashboard', dashboardRoutes);
app.use('/api/pengaturan', pengaturanRoutes);
app.use('/api/toko', tokoRoutes);
app.use('/api/shu', shuRoutes);
app.use('/api/chat', chatRoutes);
app.use('/api/laporan', laporanRoutes);
app.use('/api/logs', logsRoutes);
app.use('/api/broadcast', broadcastRoutes);
app.use('/api/notifikasi', notifikasiRoutes);
app.use('/api/pengaduan', pengaduanRoutes);
app.use('/api/transaksi', transaksiRoutes);

// Root route
app.get('/', (req, res) => {
  res.send('API Koperasi Bakamla RI v2');
});

// Error handling middleware
app.use((err: any, req: express.Request, res: express.Response, next: express.NextFunction) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Terjadi kesalahan pada server.' });
});

// Socket.io Implementation
io.on('connection', (socket) => {
  console.log('User connected:', socket.id);

  // User bergabung ke room pribadi mereka menggunakan ID mereka sendiri
  // Admin bisa mendengarkan room tertentu atau broadcasting.
  socket.on('join', (userId: string) => {
    socket.join(userId);
    console.log(`User ${userId} joined their personal room`);
  });

  socket.on('send_message', async (data: { pengirimId: string, penerimaId: string, pesan: string }) => {
    try {
      // 1. Simpan ke database
      const chat = await prisma.chat.create({
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
    } catch (error) {
      console.error('Socket send_message error:', error);
    }
  });

  socket.on('disconnect', () => {
    console.log('User disconnected:', socket.id);
  });
});

httpServer.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
