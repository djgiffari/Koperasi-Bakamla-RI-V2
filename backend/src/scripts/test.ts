import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
async function main() {
  const count = await prisma.jurnalUmum.count();
  console.log('JurnalUmum count:', count);
}
main();
