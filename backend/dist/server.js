"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const helmet_1 = __importDefault(require("helmet"));
const morgan_1 = __importDefault(require("morgan"));
const dotenv_1 = __importDefault(require("dotenv"));
const auth_1 = __importDefault(require("./routes/auth"));
const anggota_1 = __importDefault(require("./routes/anggota"));
const simpanan_1 = __importDefault(require("./routes/simpanan"));
const pinjaman_1 = __importDefault(require("./routes/pinjaman"));
dotenv_1.default.config();
const app = (0, express_1.default)();
const PORT = process.env.PORT || 3000;
// Middleware
app.use(express_1.default.json());
app.use((0, cors_1.default)());
app.use((0, helmet_1.default)());
app.use((0, morgan_1.default)('dev'));
// Routes
app.use('/api/auth', auth_1.default);
app.use('/api/anggota', anggota_1.default);
app.use('/api/simpanan', simpanan_1.default);
app.use('/api/pinjaman', pinjaman_1.default);
// Root route
app.get('/', (req, res) => {
    res.send('API Koperasi Bakamla RI v2');
});
// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ error: 'Terjadi kesalahan pada server.' });
});
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
