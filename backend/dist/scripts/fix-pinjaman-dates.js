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
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
function fixPinjamanDates() {
    return __awaiter(this, void 0, void 0, function* () {
        console.log('Fixing Pinjaman & Angsuran dates...');
        // Set Pinjaman createdAt to August 1, 2024
        const updatedPinjaman = yield prisma.pinjaman.updateMany({
            data: {
                createdAt: new Date('2024-08-01T08:00:00Z'),
                updatedAt: new Date('2024-08-01T08:00:00Z')
            }
        });
        // Set Angsuran createdAt to Sept 3, 2024
        const updatedAngsuran = yield prisma.angsuran.updateMany({
            data: {
                createdAt: new Date('2024-09-03T08:00:00Z'),
                updatedAt: new Date('2024-09-03T08:00:00Z')
            }
        });
        console.log(`Updated ${updatedPinjaman.count} pinjaman`);
        console.log(`Updated ${updatedAngsuran.count} angsuran`);
    });
}
fixPinjamanDates().then(() => prisma.$disconnect()).catch(e => { console.error(e); prisma.$disconnect(); });
