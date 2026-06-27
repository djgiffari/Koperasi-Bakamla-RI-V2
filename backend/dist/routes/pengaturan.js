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
// GET all pengaturan
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { kategori } = req.query;
        const filter = kategori ? { kategori: kategori } : {};
        const data = yield prisma_1.default.pengaturanUmum.findMany({
            where: filter,
            orderBy: { id: 'asc' }
        });
        res.json(data);
    }
    catch (error) {
        console.error('Error fetching pengaturan:', error);
        res.status(500).json({ error: 'Gagal mengambil data pengaturan' });
    }
}));
// POST new pengaturan
router.post('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { kategori, nilai } = req.body;
        if (!kategori || !nilai) {
            return res.status(400).json({ error: 'Kategori dan nilai wajib diisi' });
        }
        const newData = yield prisma_1.default.pengaturanUmum.create({
            data: {
                kategori,
                nilai
            }
        });
        res.status(201).json(newData);
    }
    catch (error) {
        console.error('Error creating pengaturan:', error);
        res.status(500).json({ error: 'Gagal menambahkan pengaturan' });
    }
}));
// DELETE pengaturan
router.delete('/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const id = parseInt(req.params.id);
        yield prisma_1.default.pengaturanUmum.delete({
            where: { id }
        });
        res.json({ message: 'Pengaturan berhasil dihapus' });
    }
    catch (error) {
        console.error('Error deleting pengaturan:', error);
        res.status(500).json({ error: 'Gagal menghapus pengaturan' });
    }
}));
exports.default = router;
