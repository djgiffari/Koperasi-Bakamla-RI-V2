import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET all angsuran
router.get('/', async (req: Request, res: Response) => {
  try {
    const angsuran = await prisma.angsuran.findMany({
      include: {
        pinjaman: {
          include: {
            anggota: true
          }
        }
      },
      orderBy: { createdAt: 'desc' }
    });
    res.json(angsuran);
  } catch (error) {
    console.error('Error fetching angsuran:', error);
    res.status(500).json({ error: 'Gagal mengambil data angsuran' });
  }
});
// PUT update status angsuran (Verifikasi Pembayaran)
router.put('/:id/status', async (req: Request, res: Response): Promise<any> => {
  try {
    const id = parseInt(req.params.id as string);
    const { status } = req.body;
    
    if (!status) return res.status(400).json({ error: 'Status diperlukan' });

    // Use transaction to update Angsuran and add to KasKoperasi if LUNAS
    const updated = await prisma.$transaction(async (tx) => {
      const currentAngsuran = await tx.angsuran.findUnique({ where: { id } });
      if (currentAngsuran?.status === 'LUNAS' && status === 'LUNAS') {
        throw new Error('Angsuran ini sudah berstatus LUNAS');
      }

      const angsuran = await tx.angsuran.update({
        where: { id },
        data: { 
          status,
          tanggalBayar: status === 'LUNAS' ? new Date() : null
        },
        include: { pinjaman: { include: { anggota: true } } }
      });

      if (status === 'LUNAS') {
        // Cek apakah kas sudah dicatat sebelumnya untuk angsuran ini
        const existingKas = await tx.jurnalUmum.findFirst({
          where: { referensiId: `ANGSURAN-${angsuran.id}` }
        });
        
        if (!existingKas) {
          const saldoTerakhir = await tx.jurnalUmum.findFirst({
            orderBy: { createdAt: 'desc' }
          });
          const saldoBaru = (saldoTerakhir?.saldoSetelahnya || 0) + angsuran.totalTagihan;

          await tx.jurnalUmum.create({
            data: {
              jenis: 'DEBIT',
              nominal: angsuran.totalTagihan,
              keterangan: `Pembayaran Angsuran Pinjaman oleh ${angsuran.pinjaman.anggota.namaLengkap} (Ke-${angsuran.bulanKe})`,
              saldoSetelahnya: saldoBaru,
              referensiId: `ANGSURAN-${angsuran.id}`,
              tipeReferensi: 'ANGSURAN'
            }
          });
          
          // Update Kas Koperasi main balance
          const kasUtama = await tx.kasKoperasi.findFirst();
          if (kasUtama) {
            await tx.kasKoperasi.update({
              where: { id: kasUtama.id },
              data: { saldo: kasUtama.saldo + angsuran.totalTagihan }
            });
          } else {
             await tx.kasKoperasi.create({ data: { saldo: angsuran.totalTagihan } });
          }
        }
      }
      return angsuran;
    });
    
    res.json(updated);
  } catch (error) {
    console.error('Error updating status angsuran:', error);
    res.status(500).json({ error: 'Gagal memperbarui status angsuran' });
  }
});

export default router;
