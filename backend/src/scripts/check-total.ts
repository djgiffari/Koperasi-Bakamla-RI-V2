import * as xlsx from 'xlsx';

const FILE_PATH = 'C:\\Users\\Giffari\\Downloads\\REKAP PENARIKAN SPSW 2024 edit.xlsx';
const workbook = xlsx.readFile(FILE_PATH);
const sheet = workbook.Sheets['SPSW BULANAN'];
const data: any[][] = xlsx.utils.sheet_to_json(sheet, { header: 1 });

let totalPokok = 0;
let totalWajib = 0;
let totalShu = 0;

for (let i = 2; i < data.length; i++) {
  const row = data[i];
  if (!row || !row[1] || typeof row[0] !== 'number') continue;
  
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
