import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import dotenv from 'dotenv';
import path from 'path';
import authRoutes from './routes/auth';
import anggotaRoutes from './routes/anggota';
import simpananRoutes from './routes/simpanan';
import pinjamanRoutes from './routes/pinjaman';
import angsuranRoutes from './routes/angsuran';
import dashboardRoutes from './routes/dashboard';
import pengaturanRoutes from './routes/pengaturan';
import fs from 'fs';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

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

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/anggota', anggotaRoutes);
app.use('/api/simpanan', simpananRoutes);
app.use('/api/pinjaman', pinjamanRoutes);
app.use('/api/angsuran', angsuranRoutes);
app.use('/api/dashboard', dashboardRoutes);
app.use('/api/pengaturan', pengaturanRoutes);

// Root route
app.get('/', (req, res) => {
  res.send('API Koperasi Bakamla RI v2');
});

// Error handling middleware
app.use((err: any, req: express.Request, res: express.Response, next: express.NextFunction) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Terjadi kesalahan pada server.' });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
