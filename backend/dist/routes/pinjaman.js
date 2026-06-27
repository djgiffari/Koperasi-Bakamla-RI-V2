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
// GET all pinjaman
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const pinjaman = yield prisma_1.default.pinjaman.findMany({
            include: {
                anggota: true
            },
            orderBy: { createdAt: 'desc' }
        });
        res.json(pinjaman);
    }
    catch (error) {
        console.error('Error fetching pinjaman:', error);
        res.status(500).json({ error: 'Gagal mengambil data pinjaman' });
    }
}));
// POST new pinjaman
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, nominal, tenor } = req.body;
        const newPinjaman = yield prisma_1.default.pinjaman.create({
            data: {
                anggotaId: parseInt(anggotaId),
                nominal: parseFloat(nominal),
                tenor: parseInt(tenor),
                status: 'PENDING_ADMIN'
            },
            include: {
                anggota: true
            }
        });
        res.status(201).json(newPinjaman);
    }
    catch (error) {
        console.error('Error creating pinjaman:', error);
        res.status(500).json({ error: 'Gagal menambahkan data pinjaman' });
    }
}));
// PUT update status pinjaman
router.put('/:id/status', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        const { status } = req.body;
        const updatedPinjaman = yield prisma_1.default.pinjaman.update({
            where: { id },
            data: {
                status,
                tanggalCair: status === 'DICAIRKAN' ? new Date() : undefined
            }
        });
        res.json(updatedPinjaman);
    }
    catch (error) {
        console.error('Error updating status pinjaman:', error);
        res.status(500).json({ error: 'Gagal memperbarui status pinjaman' });
    }
}));
// DELETE pinjaman
router.delete('/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        yield prisma_1.default.pinjaman.delete({
            where: { id }
        });
        res.json({ message: 'Pinjaman berhasil dihapus' });
    }
    catch (error) {
        console.error('Error deleting pinjaman:', error);
        res.status(500).json({ error: 'Gagal menghapus data pinjaman' });
    }
}));
exports.default = router;
