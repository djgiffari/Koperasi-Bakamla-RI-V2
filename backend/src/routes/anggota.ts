import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';
import multer from 'multer';
import path from 'path';

const router = Router();

// Configure multer storage
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, 'sk-' + uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage: storage });

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
router.post('/', upload.single('fcSkFile'), async (req: Request, res: Response) => {
  try {
    const { 
      namaLengkap, nip, pangkat, unitKerja, 
      tempatLahir, tanggalLahir, alamatKantor, noKtp, alamatRumah, noRekening, fcSkStatus 
    } = req.body;
    
    let fcSkUrl = null;
    if (req.file) {
      fcSkUrl = `/uploads/${req.file.filename}`;
    }
    
    const newAnggota = await prisma.anggota.create({
      data: {
        namaLengkap,
        nip,
        pangkat,
        unitKerja,
        tempatLahir,
        tanggalLahir: tanggalLahir ? new Date(tanggalLahir) : null,
        alamatKantor,
        noKtp,
        alamatRumah,
        noRekening,
        fcSkStatus: fcSkStatus || 'belum',
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
router.put('/:id', upload.single('fcSkFile'), async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    const { 
      namaLengkap, nip, pangkat, unitKerja, 
      tempatLahir, tanggalLahir, alamatKantor, noKtp, alamatRumah, noRekening, fcSkStatus 
    } = req.body;
    
    let updateData: any = {
      namaLengkap,
      nip,
      pangkat,
      unitKerja,
      tempatLahir,
      tanggalLahir: tanggalLahir ? new Date(tanggalLahir) : null,
      alamatKantor,
      noKtp,
      alamatRumah,
      noRekening,
      fcSkStatus
    };

    if (req.file) {
      updateData.fcSkUrl = `/uploads/${req.file.filename}`;
    }
    
    const updatedAnggota = await prisma.anggota.update({
      where: { id },
      data: updateData
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
