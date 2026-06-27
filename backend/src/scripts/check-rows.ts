import * as xlsx from 'xlsx';

const FILE_PATH = 'C:\\Users\\Giffari\\Downloads\\REKAP PENARIKAN SPSW 2024 edit.xlsx';
const workbook = xlsx.readFile(FILE_PATH);
const sheet = workbook.Sheets['SPSW BULANAN'];
const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });

console.log(`Total rows in Excel: ${data.length}`);
let validMembers = 0;
for (let i = 2; i < data.length; i++) {
    const row: any = data[i];
    if (row && row.length > 0 && row[0] !== undefined && row[0] !== null) {
        if (typeof row[0] === 'number') {
            const nama = row[1];
            if (nama && String(nama).trim() !== '') {
                validMembers++;
            }
        }
    }
}
console.log(`Valid members based on logic: ${validMembers}`);
