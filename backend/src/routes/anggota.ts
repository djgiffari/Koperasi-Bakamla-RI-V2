import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';

const router = Router();

// GET all anggota
router.get('/', async (req: Request, res: Response) => {
  try {
    const anggota = await prisma.anggota.findMany({
      orderBy: { createdAt: 'desc' }
    });
    res.json(anggota);
  } catch (error) {
    console.error('Error fetching anggota:', error);
    res.status(500).json({ error: 'Gagal mengambil data anggota' });
  }
});

// POST new anggota
router.post('/', async (req: Request, res: Response) => {
  try {
    const { namaLengkap, nip, pangkat, unitKerja, rekeningBni, fcSkUrl } = req.body;
    
    // Status can be mapped from fc_sk if needed, but we'll use string for now based on schema
    const newAnggota = await prisma.anggota.create({
      data: {
        namaLengkap,
        nip,
        pangkat,
        unitKerja,
        rekeningBni,
        fcSkUrl
      }
    });
    
    res.status(201).json(newAnggota);
  } catch (error) {
    console.error('Error creating anggota:', error);
    res.status(500).json({ error: 'Gagal menambahkan data anggota' });
  }
});

// PUT update anggota
router.put('/:id', async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    const { namaLengkap, nip, pangkat, unitKerja, rekeningBni, fcSkUrl } = req.body;
    
    const updatedAnggota = await prisma.anggota.update({
      where: { id },
      data: {
        namaLengkap,
        nip,
        pangkat,
        unitKerja,
        rekeningBni,
        fcSkUrl
      }
    });
    
    res.json(updatedAnggota);
  } catch (error) {
    console.error('Error updating anggota:', error);
    res.status(500).json({ error: 'Gagal memperbarui data anggota' });
  }
});

// DELETE anggota
router.delete('/:id', async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    
    await prisma.anggota.delete({
      where: { id }
    });
    
    res.json({ message: 'Anggota berhasil dihapus' });
  } catch (error) {
    console.error('Error deleting anggota:', error);
    res.status(500).json({ error: 'Gagal menghapus data anggota' });
  }
});

export default router;
