"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
const xlsx = __importStar(require("xlsx"));
const FILE_PATH = 'C:\\Users\\Giffari\\Downloads\\REKAP PENARIKAN SPSW 2024 edit.xlsx';
const workbook = xlsx.readFile(FILE_PATH);
const sheet = workbook.Sheets['SPSW BULANAN'];
const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });
let totalPokok = 0;
let totalWajib = 0;
let totalShu = 0;
for (let i = 2; i < data.length; i++) {
    const row = data[i];
    if (!row || !row[1] || typeof row[0] !== 'number')
        continue;
    let p = Number(row[13]) || 0;
    let w = 0;
    for (let c = 14; c <= 25; c++) {
        w += Number(row[c]) || 0;
    }
    let s = Number(row[26]) || 0;
    totalPokok += p;
    totalWajib += w;
    totalShu += s;
}
console.log('totalPokok:', totalPokok);
console.log('totalWajib:', totalWajib);
console.log('totalShu:', totalShu);
console.log('SUM:', totalPokok + totalWajib + totalShu);
