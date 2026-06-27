import * as xlsx from 'xlsx';

const filePath = 'C:\\Users\\Giffari\\Downloads\\REKAP PENARIKAN SPSW 2024 edit.xlsx';

function run() {
  const workbook = xlsx.readFile(filePath);
  const sheetNameList = workbook.SheetNames;
  
  console.log('Sheets found:', sheetNameList);
  
  for (const sheetName of sheetNameList) {
    console.log(`\n--- ${sheetName} ---`);
    const sheet = workbook.Sheets[sheetName];
    // We will parse with header: 1 to get raw arrays, so we can see what rows have headers
    const data = xlsx.utils.sheet_to_json(sheet, { header: 1 }); 
    
    // Print first 10 rows
    for (let i = 0; i < Math.min(10, data.length); i++) {
      console.log(`Row ${i + 1}:`, data[i]);
    }
  }
}

run();
