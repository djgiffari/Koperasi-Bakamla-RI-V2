const { PrismaClient } = require('@prisma/client');
const http = require('http');

const prisma = new PrismaClient();

async function request(method, path, data = null, token = null) {
  return new Promise((resolve, reject) => {
    const dataString = data ? JSON.stringify(data) : '';
    const options = {
      hostname: 'localhost',
      port: 3000,
      path: path,
      method: method,
      headers: {
        'Content-Type': 'application/json',
      }
    };

    if (token) {
      options.headers['Authorization'] = `Bearer ${token}`;
    }
    if (data) {
      options.headers['Content-Length'] = Buffer.byteLength(dataString);
    }

    const req = http.request(options, (res) => {
      let responseBody = '';
      res.on('data', (chunk) => responseBody += chunk);
      res.on('end', () => {
        try {
          const parsed = JSON.parse(responseBody);
          resolve({ status: res.statusCode, body: parsed });
        } catch (e) {
          resolve({ status: res.statusCode, body: responseBody });
        }
      });
    });

    req.on('error', (e) => reject(e));
    if (data) req.write(dataString);
    req.end();
  });
}

async function runTests2() {
  console.log('=== STARTING PART 2 QA & QC TEST (TRANSACTIONS) ===\n');

  let adminUser = await prisma.user.findFirst();
  if (!adminUser) {
    console.log('No user found in DB. Creating one...');
    const bcrypt = require('bcrypt');
    const hp = await bcrypt.hash('password123', 10);
    adminUser = await prisma.user.create({
      data: {
        username: 'qa_admin_' + Date.now(),
        password: hp,
        name: 'QA Admin',
        role: 'ADMIN'
      }
    });
  }
  
  const jwt = require('jsonwebtoken');
  const JWT_SECRET = process.env.JWT_SECRET || 'secret_key_koperasi_bakamla_v2';
  const adminToken = jwt.sign({ id: adminUser.id, role: adminUser.role, username: adminUser.username }, JWT_SECRET, { expiresIn: '1d' });

  // Get our newly registered active user
  const activeAnggota = await prisma.anggota.findFirst({ where: { status: 'AKTIF' } });
  if (!activeAnggota) {
    console.error('No active anggota found. Creating one...');
    // Create an active user if none exists
    const bcrypt = require('bcrypt');
    const hp = await bcrypt.hash('Password123', 10);
    var anggota = await prisma.anggota.create({
      data: {
        nip: 'QA_NIP_' + Date.now(),
        namaLengkap: 'QA Test Active User',
        email: 'qa_active@example.com',
        status: 'AKTIF',
        password: hp
      }
    });
  } else {
    var anggota = activeAnggota;
  }
  
  const userToken = jwt.sign({ id: anggota.id, role: 'ANGGOTA', nip: anggota.nip }, JWT_SECRET, { expiresIn: '30d' });

  console.log(`Using Admin: ${adminUser.username} and Anggota: ${anggota.namaLengkap}`);

  // 1. SIMPANAN: Pengajuan setoran dari Mobile
  console.log('\n[Simpanan] 1. Pengajuan Setoran Sukarela');
  let res = await request('POST', '/api/simpanan', {
    anggotaId: anggota.id,
    jenisSimpanan: 'SUKARELA',
    jenisMutasi: 'SETORAN',
    nominal: 500000,
    keterangan: 'Setoran QA'
  }, userToken);
  console.log(`Status: ${res.status}, Response:`, res.body);
  const mutasiId = res.body.data?.id;
  
  if (mutasiId) {
     console.log('\n[Simpanan] 2. Admin Verifikasi Setujui');
     const verifyRes = await request('PUT', `/api/simpanan/${mutasiId}/status`, {
       status: 'DISETUJUI'
     }, adminToken);
     console.log(`Status: ${verifyRes.status}, Response:`, verifyRes.body);

     const saldoCheck = await request('GET', `/api/simpanan/saldo/${anggota.id}`, null, userToken);
     console.log(`[Simpanan] 3. Cek Saldo Mobile. Status: ${saldoCheck.status}, Response:`, saldoCheck.body);
  }

  // 2. PINJAMAN & EDGE CASE: Pinjaman melebihi limit
  console.log('\n[Pinjaman] 1. Edge Case - Pinjaman sangat besar (9 Milyar)');
  const pinjamanBesarRes = await request('POST', '/api/pinjaman', {
    anggotaId: anggota.id,
    nominal: 9000000000,
    tenor: 12,
    skemaBunga: 'FLAT'
  }, userToken);
  console.log(`Status: ${pinjamanBesarRes.status}, Response:`, pinjamanBesarRes.body);
  
  if (pinjamanBesarRes.status === 200 || pinjamanBesarRes.status === 201) {
     console.error('--> BUG FOUND: No hard limit validation on Pinjaman nominal!');
  }

  console.log('\n[Pinjaman] 2. Pengajuan Pinjaman Normal');
  const pinjamanNormalRes = await request('POST', '/api/pinjaman', {
    anggotaId: anggota.id,
    nominal: 500000, // Harus <= 3x saldo (1.5jt)
    tenor: 10,
    skemaBunga: 'FLAT'
  }, userToken);
  console.log(`Status: ${pinjamanNormalRes.status}, Response:`, pinjamanNormalRes.body);
  const pinjamanId = pinjamanNormalRes.body.data?.id;

  if (pinjamanId) {
    console.log('\n[Pinjaman] 3. Admin Cairkan Dana');
    const cairRes = await request('PUT', `/api/pinjaman/${pinjamanId}/status`, {
      status: 'DICAIRKAN'
    }, adminToken);
    console.log(`Status: ${cairRes.status}, Response:`, cairRes.body);

    console.log('\n[Angsuran] 1. Cek Angsuran Otomatis Terbuat');
    const cekAngsuran = await request('GET', '/api/pinjaman/angsuran', null, adminToken);
    const angsurans = (cekAngsuran.body || []).filter(a => a.pinjamanId === pinjamanId);
    console.log(`Ditemukan ${angsurans.length} angsuran untuk pinjaman ini.`);
    
    if (angsurans.length > 0) {
       const angsuranTarget = angsurans[0];
       console.log(`\n[Angsuran] 2. Pembayaran Angsuran Pertama`);
       const payRes = await request('PUT', `/api/angsuran/${angsuranTarget.id}/status`, {
         status: 'LUNAS'
       }, adminToken);
       console.log(`Status: ${payRes.status}, Response:`, payRes.body);
       
       console.log(`\n[Angsuran] 3. Edge Case - Membayar yang sudah lunas`);
       const payLunasRes = await request('PUT', `/api/angsuran/${angsuranTarget.id}/status`, {
         status: 'LUNAS'
       }, adminToken);
       console.log(`Status: ${payLunasRes.status}, Response:`, payLunasRes.body);
       if (payLunasRes.status === 200) {
          console.error('--> BUG FOUND: Can transition already LUNAS angsuran to LUNAS again!');
       }
    }
  }

  // PENGADUAN
  console.log('\n[Pengaduan] 1. Mengajukan Pengaduan');
  const pengaduanRes = await request('POST', '/api/pengaduan', {
    anggotaId: anggota.id,
    kategori: 'UMUM',
    subjek: 'Test QA',
    deskripsi: 'Ini adalah tes pengaduan'
  }, userToken);
  console.log(`Status: ${pengaduanRes.status}, Response:`, pengaduanRes.body);

  const pengaduanId = pengaduanRes.body.pengaduan?.id;
  
  if (pengaduanId) {
    console.log('\n[Pengaduan] 2. Admin Membalas');
    const balasRes = await request('PUT', `/api/pengaduan/admin/${pengaduanId}/status`, {
      status: 'RESOLVED',
      balasanAdmin: 'Diterima, sedang diproses.'
    }, adminToken);
    console.log(`Status: ${balasRes.status}, Response:`, balasRes.body);
  }

  console.log('\n=== END OF PART 2 ===');
  process.exit(0);
}

runTests2();
