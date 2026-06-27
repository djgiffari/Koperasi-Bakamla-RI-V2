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
// GET all simpanan
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const simpanan = yield prisma_1.default.simpanan.findMany({
            include: {
                anggota: true
            },
            orderBy: { createdAt: 'desc' }
        });
        res.json(simpanan);
    }
    catch (error) {
        console.error('Error fetching simpanan:', error);
        res.status(500).json({ error: 'Gagal mengambil data simpanan' });
    }
}));
// POST new simpanan
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { anggotaId, jenisSimpanan, saldo } = req.body;
        const newSimpanan = yield prisma_1.default.simpanan.create({
            data: {
                anggotaId: parseInt(anggotaId),
                jenisSimpanan: jenisSimpanan.toUpperCase(),
                saldo: parseFloat(saldo)
            },
            include: {
                anggota: true
            }
        });
        res.status(201).json(newSimpanan);
    }
    catch (error) {
        console.error('Error creating simpanan:', error);
        res.status(500).json({ error: 'Gagal menambahkan data simpanan' });
    }
}));
// DELETE simpanan
router.delete('/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        yield prisma_1.default.simpanan.delete({
            where: { id }
        });
        res.json({ message: 'Simpanan berhasil dihapus' });
    }
    catch (error) {
        console.error('Error deleting simpanan:', error);
        res.status(500).json({ error: 'Gagal menghapus data simpanan' });
    }
}));
exports.default = router;
