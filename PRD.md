# Product Requirements Document (PRD)
## Aplikasi Koperasi Bakamla RI
**Versi:** v2.1 (Penyempurnaan Detail UI/UX, Logika Dashboard, dan Alur Sistem)  
**Nama Produk:** Koperasi Bakamla RI

---

## 1. Latar Belakang & Visi Produk
Aplikasi Koperasi Bakamla RI v2 hadir untuk mendigitalisasi seluruh layanan koperasi agar anggota dapat mengakses layanan secara aman, nyaman, dan real-time. Dengan pembaruan ini, antarmuka aplikasi dirombak secara total menjadi sangat modern, mengedepankan prinsip UI/UX terkini (vibrant colors, glassmorphism, micro-animations) yang responsif dan tidak terkesan kaku.

Sistem secara garis besar terdiri dari:
* **Admin Panel (Web):** SPA berbasis React.js (Vite), menggunakan Tailwind CSS untuk styling sistem, meniadakan komponen default browser yang kaku.
* **Mobile App Anggota (Android & iOS):** Dibangun menggunakan Flutter, memfokuskan pada kemudahan akses, upload dokumen, dan komunikasi real-time.
* **Backend API & Database:** Server yang melayani sinkronisasi data real-time, manajemen state, dan pengelolaan file (gambar/dokumen).

---

## 2. Standar Desain & Estetika (UI/UX Guidelines)
Aplikasi harus mengikuti standar visual berikut secara ketat agar AI atau developer yang melanjutkan pengembangan memahami arah desainnya:
* **Warna Tema (Color Palette):**
  * **Primary:** Navy Blue (Elegan, Profesional)
  * **Secondary/Accent:** Gold (Premium, Highlight)
  * **Background/Surface:** White / Off-White / Sleek Dark Mode (tergantung tema).
* **Logo & Branding:** Logo Koperasi resmi (`logo.png`) harus selalu digunakan, baik sebagai *favicon*, header di dashboard web, maupun di layar login aplikasi mobile.
* **Sistem Popup & Notifikasi (CRITICAL):**
  * **TIDAK BOLEH** menggunakan `window.alert()`, `window.confirm()`, atau dialog default sistem operasi.
  * **Web Admin:** Harus menggunakan Custom Modal Popup di tengah layar dengan animasi CSS `scale-in bouncing`. State modal ini dikendalikan secara terpusat (contoh: di `App.tsx`) sehingga dipanggil secara global.
  * **Mobile (Flutter):** Harus menggunakan fungsi bantuan (helper) khusus, misal `showCustomPopup`, yang memanfaatkan `showGeneralDialog` dengan transisi skala animasi kurva `easeOutBack`.
* **Struktur Menu (Sidebar Web):** 
  * Menu tidak boleh menumpuk. Menu yang sejenis harus digabungkan ke dalam sistem *Accordion* (Dropdown) atau Sub-menu (Misal: Kategori "Transaksi" memiliki sub-menu "Simpanan", "Pinjaman", "Angsuran").

---

## 3. Rincian Fitur & Logika Dashboard

### 3.1. Dashboard Web Admin
Dashboard berfungsi sebagai pusat kendali operasional dan analitik koperasi. Tidak hanya sekadar angka, dashboard harus dirancang menggunakan Grid Layout dengan pembagian area yang informatif:

**A. Top Card Metrics (Ringkasan Cepat):**
* **Total Anggota:** Menampilkan angka anggota aktif, dengan indikator kecil (misal panah hijau) untuk tren penambahan anggota bulan ini.
* **Simpanan Keseluruhan:** Total saldo gabungan dari Simpanan Pokok, Wajib, dan Sukarela.
* **Pinjaman Aktif:** Total dana koperasi yang saat ini sedang dipinjamkan (Status = Dicairkan) beserta estimasi pengembalian bulan ini.
* **Omset Toko Koperasi:** Total penjualan dari E-Commerce Mobile dan POS bulan ini.

**B. Grafik Analitik (Bagian Tengah):**
* **Grafik Arus Kas (Cashflow):** Line chart atau Bar chart membandingkan pemasukan (simpanan, angsuran masuk) vs pengeluaran (pencairan pinjaman, penarikan) setiap bulan.
* **Grafik Penjualan Toko:** Menampilkan tren pembelian produk paling laku (Best Seller).

**C. Tabel Aktivitas Terbaru (Bagian Bawah):**
* **Menunggu Persetujuan (Pending Approvals):** Tabel mini yang menampilkan daftar pengajuan pinjaman atau simpanan terbaru yang menunggu klik "Setuju" dari admin, lengkap dengan tombol akses cepat.
* **Aktivitas Transaksi Terakhir:** Log langsung (real-time) anggota yang baru saja mentransfer atau bertransaksi.

### 3.2. Dashboard Mobile (Anggota)
Dashboard di sisi mobile harus dirancang agar anggota merasa seperti menggunakan aplikasi perbankan (mobile banking) premium.

**A. Header Information:**
* **Profil Singkat:** Foto Profil berbentuk lingkaran (jika belum upload, muncul inisial) di pojok kiri atas, dan Sapaan "Halo, [Nama Anggota]".
* **Notifikasi:** Ikon Lonceng di pojok kanan atas, ada badge merah jika ada notifikasi baru (Approval, Chat, Jatuh Tempo).

**B. Card Saldo Utama (Hero Section):**
* Berbentuk kartu seperti kartu kredit fisik/digital (menggunakan gradasi warna Navy-Gold).
* Menampilkan dua informasi vital: **Total Simpanan Saya** (Pokok+Wajib+Sukarela) dan **Sisa Pinjaman Saya**.
* Terdapat tombol kecil (mata) untuk menyembunyikan/menampilkan saldo (hide/unhide).

**C. Quick Actions (Menu Cepat):**
* Grid tombol berbentuk icon bulat modern (berada di bawah kartu):
  1. Ajukan Pinjaman
  2. Setor Simpanan
  3. Bayar Angsuran
  4. Belanja Toko Koperasi

**D. SHU & Promo (Widgets):**
* **Widget SHU:** Kartu kecil khusus menampilkan SHU tahun berjalan yang berhak diterima anggota.
* **Banner Promo Toko:** Image Slider / Carousel berisi info diskon produk sembako atau barang baru dari Toko Koperasi.

**E. Bottom Navigation Bar:**
* Menu utama di bagian bawah layar: Home, Toko, Chat Admin, Profil.

---

## 4. Rincian Fitur Utama Lainnya

### 4.1. Manajemen Anggota & Fleksibilitas CRUD (Web Admin)
* **Tabel Data:** Harus menyertakan paginasi, fitur *search*, dan *filter*.
* **Aksi Edit/Hapus:** Tombol aksi pada tabel harus fleksibel (menggunakan icon modern).
* **Form Eksekusi:** Saat menambah atau mengedit anggota, form sebaiknya menggunakan sistem *Drawer* (panel geser dari samping) atau *Modal Overlay*, tidak melempar user ke halaman baru sehingga proses terasa cepat (Single Page Application feel).

### 4.2. Upload Lampiran (Attachment System)
Sistem ini sangat krusial sebagai validasi transaksi.
* **Pengajuan Pinjaman (Mobile):** Saat mengisi form, anggota **wajib** mengunggah file **KTP** dan **Slip Gaji**. Tanpa file ini, tombol "Ajukan" tidak bisa ditekan (disabled).
* **Setor Simpanan Sukarela / Bayar Angsuran Manual:** Jika user memilih metode pembayaran "Transfer Bank", user **wajib** mengunggah "Bukti Transfer" berupa gambar.
* **Profil Anggota:** Upload Foto Profil.
* **Web Admin Side:** Admin dapat membuka, melihat (preview), atau mengunduh dokumen lampiran tersebut langsung dari tabel Approval sebelum menyetujui (Approve) transaksi.

### 4.3. Fitur Live Chat (Customer Service Koperasi)
* **Mobile (Anggota):** Terdapat menu khusus chat. UI mirip WhatsApp. Pesan dari admin tampil dengan bubble abu-abu, pesan anggota warna biru/navy. Menampilkan indikator jam kirim dan centang read.
* **Web Admin (Inbox):** Memiliki panel khusus. Sidebar sebelah kiri berisi daftar anggota yang aktif chat. Sebelah kanan adalah riwayat percakapan. Jika ada chat masuk baru saat admin di menu lain, muncul notifikasi di lonceng atau toast *animasi popup*.

### 4.4. Toko Koperasi & Point of Sales (POS)
Fitur ini menjembatani dua jenis pembeli: pembeli digital (aplikasi) dan fisik (datang ke toko). Keduanya harus berbagi satu database stok (Inventory).
* **Toko Koperasi (Mobile):**
  * Katalog interaktif, filter berdasarkan kategori.
  * Sistem Keranjang (Cart) dan Checkout.
  * Opsi Pembayaran: Potong Saldo Simpanan, Paylater Koperasi (Kasbon), atau Transfer.
* **Point of Sales / POS (Web Admin):**
  * Tampilan *Cashier System*. Ada daftar produk (bisa di-klik), panel order di sebelah kanan.
  * Menghitung kembalian otomatis jika bayar tunai.
  * Jika barang terjual lewat POS, stok otomatis berkurang, sehingga pembeli di aplikasi Mobile tidak bisa membeli barang yang sudah habis.

---

## 5. Alur Logika Persetujuan (Approval Logic)

**Alur Pinjaman Detail:**
1. **Request:** Anggota -> Input Nominal -> Input Tenor -> Upload KTP -> Upload Gaji -> Submit. (Status: `PENDING_ADMIN`)
2. **Verifikasi Lampiran:** Admin Web melihat request -> Cek foto lampiran apakah valid -> Klik Verifikasi. (Status: `PENDING_BENDAHARA`)
3. **Persetujuan Akhir:** Bendahara mengecek likuiditas koperasi -> Klik Approve. (Status: `DICAIRKAN` atau `AKTIF`)
4. **Trigger Otomatis:** Sistem langsung membuat *Jadwal Angsuran* sejumlah tenor bulan yang dipilih, lengkap dengan tanggal jatuh tempo.

---

## 6. Spesifikasi Database (Atribut Penting)
* **Tabel Pinjaman:** Wajib ada field `file_ktp` (string url), `file_slip_gaji` (string url).
* **Tabel Transaksi/Simpanan/Angsuran:** Wajib ada field `lampiran_bukti` (string url).
* **Tabel Anggota:** Wajib ada field `foto_profil`.
* **Tabel Chat:** `id`, `pengirim_id` (admin/anggota), `penerima_id`, `pesan`, `timestamp`, `is_read`.

---

## 7. Aturan Pengembangan (Untuk A.I. / Developer di Masa Depan)
* **Kerapian Kode (Refactoring):** Pisahkan komponen-komponen yang kompleks. Contoh: Pada `App.tsx` di React, jangan gabungkan semua rute halaman dan layout di satu file. Pisahkan rute, logika popup, dan komponen sidebar ke dalam file-file terpisah.
* **Data Kosong (Empty States):** Jika tidak ada data pinjaman, data anggota, atau pesanan toko, tampilkan komponen "Empty State" berupa ilustrasi menarik dan teks (misal: "Belum ada transaksi bulan ini"), **jangan** dibiarkan kosong blank.
* **Error Handling:** Jika API gagal/terputus, jangan biarkan aplikasi *freeze*. Tampilkan custom popup dengan pesan human-friendly: "Maaf, koneksi ke server sedang bermasalah. Coba lagi nanti."

---

*Dokumen ini merupakan acuan mutlak (Source of Truth) untuk segala proses refactoring, perbaikan bug, atau penambahan fitur baru pada Aplikasi Koperasi Bakamla RI v2.*
