import { Router, Request, Response } from 'express';
import prisma from '../utils/prisma';
import { auditLog } from '../utils/audit';

const router = Router();

// GET all products (Katalog)
router.get('/produk', async (req: Request, res: Response) => {
  try {
    const products = await prisma.produk.findMany({
      where: { stok: { gt: 0 } }, // Only show products with stock
      orderBy: { nama: 'asc' }
    });
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: 'Gagal mengambil data produk' });
  }
});

// POST new product (Admin)
router.post('/produk', auditLog('CREATE_PRODUK', 'Produk'), async (req: Request, res: Response) => {
  try {
    const { nama, kategori, hargaJual, hargaModal, stok, gambarUrl } = req.body;
    const product = await prisma.produk.create({
      data: {
        nama,
        kategori,
        hargaJual: parseFloat(hargaJual),
        hargaModal: parseFloat(hargaModal),
        stok: parseInt(stok),
        gambarUrl
      }
    });
    res.status(201).json(product);
  } catch (error) {
    res.status(500).json({ error: 'Gagal menambahkan produk' });
  }
});

// POST Checkout (POS & Mobile)
router.post('/checkout', async (req: Request, res: Response): Promise<any> => {
  try {
    const { anggotaId, metodePembayaran, items } = req.body;
    // items = [{ produkId, jumlah }]

    if (!items || items.length === 0) {
      return res.status(400).json({ error: 'Keranjang kosong' });
    }

    const orderResult = await prisma.$transaction(async (tx) => {
      let totalHarga = 0;
      let orderItemsData = [];

      // Validasi stok & hitung harga
      for (const item of items) {
        const produk = await tx.produk.findUnique({ where: { id: item.produkId } });
        if (!produk || produk.stok < item.jumlah) {
          throw new Error(`Stok produk ${produk?.nama || item.produkId} tidak mencukupi`);
        }

        const hargaSatuan = produk.hargaJual;
        totalHarga += hargaSatuan * item.jumlah;

        orderItemsData.push({
          produkId: item.produkId,
          jumlah: item.jumlah,
          hargaSatuan: hargaSatuan
        });

        // Kurangi stok
        await tx.produk.update({
          where: { id: item.produkId },
          data: { stok: produk.stok - item.jumlah }
        });
      }

      // Validasi Pembayaran
      if (metodePembayaran === 'POTONG_SALDO') {
        const simpanan = await tx.simpanan.findFirst({
          where: { anggotaId, jenisSimpanan: 'SUKARELA' }
        });
        if (!simpanan || simpanan.saldo < totalHarga) {
          throw new Error('Saldo simpanan sukarela tidak mencukupi untuk pembayaran ini');
        }
        // Kurangi saldo
        await tx.simpanan.update({
          where: { id: simpanan.id },
          data: { saldo: simpanan.saldo - totalHarga }
        });
      } else if (metodePembayaran === 'PAYLATER') {
        // Cek limit paylater (misal 50% dari sisa gaji, di sini kita hardcode limit sederhana)
        const limitPaylater = 2000000; 
        const tagihanAktif = await tx.tagihanPaylater.aggregate({
          where: { anggotaId, status: 'BELUM_BAYAR' },
          _sum: { nominal: true }
        });
        const hutangBerjalan = tagihanAktif._sum.nominal || 0;
        
        if (hutangBerjalan + totalHarga > limitPaylater) {
          throw new Error('Pembelian ditolak. Melebihi limit Paylater Anda (Rp 2.000.000)');
        }
      }

      // Buat Order
      const newOrder = await tx.order.create({
        data: {
          totalHarga,
          metodePembayaran,
          status: 'SELESAI', // Langsung selesai untuk POS digital
          items: {
            create: orderItemsData
          }
        }
      });

      // Proses Jurnal & Tagihan pasca-order
      if (metodePembayaran === 'CASH' || metodePembayaran === 'TRANSFER' || metodePembayaran === 'POTONG_SALDO') {
        const kas = await tx.kasKoperasi.findFirst();
        if (kas) {
          await tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: kas.saldo + totalHarga } });
          await tx.jurnalUmum.create({
            data: {
              keterangan: `Penjualan Toko (Order ID: ${newOrder.id}) via ${metodePembayaran}`,
              jenis: 'DEBIT',
              nominal: totalHarga,
              saldoSetelahnya: kas.saldo + totalHarga,
              referensiId: String(newOrder.id),
              tipeReferensi: 'ORDER'
            }
          });
        }
      } else if (metodePembayaran === 'PAYLATER') {
        // Buat tagihan jatuh tempo bulan depan
        const date = new Date();
        const jatuhTempo = new Date(date.setMonth(date.getMonth() + 1));
        
        await tx.tagihanPaylater.create({
          data: {
            orderId: newOrder.id,
            anggotaId,
            nominal: totalHarga,
            status: 'BELUM_BAYAR',
            jatuhTempo
          }
        });
      }

      return newOrder;
    });

    res.status(201).json({ message: 'Checkout berhasil', data: orderResult });
  } catch (error: any) {
    console.error('Error checkout POS:', error);
    res.status(400).json({ error: error.message || 'Gagal memproses checkout' });
  }
});

export default router;
