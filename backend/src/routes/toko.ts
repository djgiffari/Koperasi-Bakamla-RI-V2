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

// PUT update product
router.put('/produk/:id', auditLog('UPDATE_PRODUK', 'Produk'), async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    const { nama, kategori, hargaJual, hargaModal, stok, gambarUrl } = req.body;
    const product = await prisma.produk.update({
      where: { id },
      data: {
        nama,
        kategori,
        hargaJual: parseFloat(hargaJual),
        hargaModal: parseFloat(hargaModal),
        stok: parseInt(stok),
        gambarUrl
      }
    });
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: 'Gagal mengubah produk' });
  }
});

// DELETE product
router.delete('/produk/:id', auditLog('DELETE_PRODUK', 'Produk'), async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.id as string);
    await prisma.produk.delete({ where: { id } });
    res.json({ message: 'Produk berhasil dihapus' });
  } catch (error) {
    res.status(500).json({ error: 'Gagal menghapus produk' });
  }
});

// GET all orders (Untuk POS dashboard)
router.get('/order', async (req: Request, res: Response) => {
  try {
    const orders = await prisma.order.findMany({
      include: { tagihanPaylater: { include: { anggota: true } } },
      orderBy: { createdAt: 'desc' }
    });
    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: 'Gagal mengambil data pesanan' });
  }
});

// GET user orders (Untuk Mobile Riwayat Toko)
router.get('/order/anggota/:anggotaId', async (req: Request, res: Response) => {
  try {
    let validAnggotaId = parseInt(req.params.anggotaId as string);
    
    const anggotaExist = await prisma.anggota.findUnique({ where: { id: validAnggotaId } });
    if (!anggotaExist) {
      return res.status(404).json({ error: 'Data anggota tidak ditemukan' });
    }
    
    // Cari semua order yang terkait dengan anggota ini via TagihanPaylater
    const tagihans = await prisma.tagihanPaylater.findMany({
      where: { anggotaId: validAnggotaId },
      include: {
        order: {
          include: {
            items: {
              include: { produk: true }
            }
          }
        }
      },
      orderBy: { createdAt: 'desc' }
    });
    
    const orders = tagihans.map(t => t.order);
    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: 'Gagal mengambil riwayat pesanan toko' });
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
        if (item.jumlah <= 0) {
          throw new Error('Jumlah pesanan tidak valid');
        }
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

      // Validasi Pembayaran untuk Potong Saldo
      if (metodePembayaran === 'POTONG_SALDO') {
        if (!anggotaId) throw new Error('POTONG_SALDO hanya untuk anggota');
        const simpanan = await tx.simpanan.findFirst({
          where: { anggotaId, jenisSimpanan: 'SUKARELA' }
        });
        if (!simpanan || simpanan.saldo < totalHarga) {
          throw new Error('Saldo simpanan sukarela tidak mencukupi untuk pembayaran ini');
        }
      }

      let validAnggotaId = typeof anggotaId === 'string' ? parseInt(anggotaId) : anggotaId;
      let isOnline = validAnggotaId != null;

      if (isOnline) {
        const anggotaExist = await tx.anggota.findUnique({ where: { id: validAnggotaId } });
        if (!anggotaExist) {
          throw new Error('Data anggota tidak ditemukan');
        }
      }

      const initialStatus = isOnline ? 'PENDING' : 'SELESAI';

      // Buat Order
      const newOrder = await tx.order.create({
        data: {
          totalHarga,
          metodePembayaran,
          status: initialStatus,
          items: {
            create: orderItemsData
          }
        }
      });

      // Jika offline, langsung proses pembayaran
      if (!isOnline) {
        if (metodePembayaran === 'CASH' || metodePembayaran === 'TRANSFER') {
          const kas = await tx.kasKoperasi.findFirst();
          if (kas) {
            await tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: kas.saldo + totalHarga } });
            await tx.jurnalUmum.create({
              data: {
                keterangan: `Penjualan Toko (Order ID: ${newOrder.id}) via ${metodePembayaran} (Offline)`,
                jenis: 'DEBIT',
                nominal: totalHarga,
                saldoSetelahnya: kas.saldo + totalHarga,
                referensiId: String(newOrder.id),
                tipeReferensi: 'ORDER'
              }
            });
          }
        }
      } else if (isOnline) {
        // Gunakan TagihanPaylater sebagai penghubung Order ke Anggota (baik Paylater maupun Tunai/Transfer/Potong Saldo online)
        // Agar admin tahu siapa yang memesan dan masuk ke riwayat pembelanjaan anggota
        const date = new Date();
        const jatuhTempo = new Date(date.setMonth(date.getMonth() + 1));
        await tx.tagihanPaylater.create({
          data: {
            orderId: newOrder.id,
            anggotaId: validAnggotaId!,
            nominal: totalHarga,
            status: 'BELUM_BAYAR', // Nanti jadi LUNAS saat diverifikasi POS
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

// PUT Verify Online Order (Admin POS)
router.put('/order/:id/verify', async (req: Request, res: Response): Promise<any> => {
  try {
    const orderId = parseInt(req.params.id as string);
    const { anggotaId } = req.body; // Butuh anggotaId jika metode POTONG_SALDO

    const orderResult = await prisma.$transaction(async (tx) => {
      const order = await tx.order.findUnique({ where: { id: orderId } });
      if (!order) throw new Error('Pesanan tidak ditemukan');
      if (order.status === 'SELESAI') throw new Error('Pesanan sudah diverifikasi/selesai');

      if (order.metodePembayaran === 'POTONG_SALDO') {
        if (!anggotaId) throw new Error('Anggota ID diperlukan untuk potongan saldo');
        const simpanan = await tx.simpanan.findFirst({
          where: { anggotaId, jenisSimpanan: 'SUKARELA' }
        });
        if (!simpanan || simpanan.saldo < order.totalHarga) {
          throw new Error('Saldo simpanan sukarela anggota tidak mencukupi saat ini');
        }
        await tx.simpanan.update({
          where: { id: simpanan.id },
          data: { saldo: simpanan.saldo - order.totalHarga }
        });
      }

      // Jurnal & Kas
      if (order.metodePembayaran === 'CASH' || order.metodePembayaran === 'TRANSFER' || order.metodePembayaran === 'POTONG_SALDO') {
        const kas = await tx.kasKoperasi.findFirst();
        if (kas) {
          await tx.kasKoperasi.update({ where: { id: kas.id }, data: { saldo: kas.saldo + order.totalHarga } });
          await tx.jurnalUmum.create({
            data: {
              keterangan: `Penjualan Toko (Order ID: ${order.id}) via ${order.metodePembayaran} (Verified)`,
              jenis: 'DEBIT',
              nominal: order.totalHarga,
              saldoSetelahnya: kas.saldo + order.totalHarga,
              referensiId: String(order.id),
              tipeReferensi: 'ORDER'
            }
          });
        }
      }

      // Update status TagihanPaylater menjadi LUNAS jika ada
      await tx.tagihanPaylater.updateMany({
        where: { orderId: orderId },
        data: { status: 'LUNAS', tanggalBayar: new Date() }
      });

      // Update order status
      const updatedOrder = await tx.order.update({
        where: { id: orderId },
        data: { status: 'SELESAI' }
      });

      return updatedOrder;
    });

    res.json({ message: 'Pesanan berhasil diverifikasi', data: orderResult });
  } catch (error: any) {
    res.status(400).json({ error: error.message || 'Gagal memverifikasi pesanan' });
  }
});

// PUT Cancel Online Order (Admin POS)
router.put('/order/:id/cancel', async (req: Request, res: Response): Promise<any> => {
  try {
    const orderId = parseInt(req.params.id as string);

    const orderResult = await prisma.$transaction(async (tx) => {
      const order = await tx.order.findUnique({ 
        where: { id: orderId },
        include: { items: true }
      });
      if (!order) throw new Error('Pesanan tidak ditemukan');
      if (order.status !== 'PENDING') throw new Error('Hanya pesanan PENDING yang bisa dibatalkan');

      // Kembalikan stok
      for (const item of order.items) {
        const produk = await tx.produk.findUnique({ where: { id: item.produkId } });
        if (produk) {
          await tx.produk.update({
            where: { id: produk.id },
            data: { stok: produk.stok + item.jumlah }
          });
        }
      }

      // Reversal Jurnal & Kas jika order OFFLINE (CASH / TRANSFER)
      // Karena saat checkout langsung masuk Kas
      if (order.metodePembayaran === 'CASH' || order.metodePembayaran === 'TRANSFER') {
        const kas = await tx.kasKoperasi.findFirst();
        if (kas) {
          // Kurangi saldo karena pesanan dibatalkan
          await tx.kasKoperasi.update({ 
            where: { id: kas.id }, 
            data: { saldo: kas.saldo - order.totalHarga } 
          });
          
          await tx.jurnalUmum.create({
            data: {
              keterangan: `Pembatalan Penjualan Toko (Order ID: ${order.id}) via ${order.metodePembayaran}`,
              jenis: 'KREDIT',
              nominal: order.totalHarga,
              saldoSetelahnya: kas.saldo - order.totalHarga,
              referensiId: String(order.id),
              tipeReferensi: 'ORDER_CANCEL'
            }
          });
        }
      }

      // Kembalikan status Order menjadi BATAL (tidak dihapus agar ada di riwayat pembeli)
      const updatedOrder = await tx.order.update({
        where: { id: orderId },
        data: { status: 'BATAL' }
      });

      // Update juga tagihan paylater menjadi BATAL (karena asalnya BELUM_BAYAR/LUNAS, tapi ini pembatalan)
      // Kita asumsikan kalau enum StatusAngsuran tidak ada BATAL, kita biarkan saja tapi hapus nominalnya jadi 0, 
      // Atau lebih baik kita tidak hapus tagihannya agar relasi order-anggota tetap ada (sehingga bisa dilacak),
      // Tapi update nominal jadi 0 agar tidak jadi hutang.
      await tx.tagihanPaylater.updateMany({
        where: { orderId: orderId },
        data: { nominal: 0 }
      });

      return updatedOrder;
    });

    res.json({ message: 'Pesanan berhasil dibatalkan', data: orderResult });
  } catch (error: any) {
    res.status(400).json({ error: error.message || 'Gagal membatalkan pesanan' });
  }
});

export default router;
