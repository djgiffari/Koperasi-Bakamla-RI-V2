import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import '../config.dart';
import 'riwayat_toko_screen.dart';

class TokoScreen extends StatefulWidget {
  final int anggotaId;
  const TokoScreen({super.key, required this.anggotaId});

  @override
  State<TokoScreen> createState() => _TokoScreenState();
}

class _TokoScreenState extends State<TokoScreen> {
  List<dynamic> _produkList = [];
  bool _isLoading = true;
  List<Map<String, dynamic>> _cartItems = [];
  String _selectedPaymentMethod = 'POTONG_SALDO';

  @override
  void initState() {
    super.initState();
    _fetchProduk();
  }

  Future<void> _fetchProduk() async {
    setState(() => _isLoading = true);
    try {
      final response = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/toko/produk'));
      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            _produkList = jsonDecode(response.body);
            _isLoading = false;
          });
        }
      } else {
        if (mounted) setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint('Error fetching produk: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String formatRupiah(dynamic number) {
    if (number == null) return "Rp 0";
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(number);
  }

  void _beliProduk(dynamic produk) {
    int maxStok = produk['stok'];
    
    // Check if already in cart
    int existingIndex = _cartItems.indexWhere((item) => item['produkId'] == produk['id']);
    
    if (existingIndex >= 0) {
      if (_cartItems[existingIndex]['jumlah'] >= maxStok) {
        _showErrorSnackBar('Stok maksimal untuk ${produk['nama']} adalah $maxStok');
        return;
      }
      setState(() {
        _cartItems[existingIndex]['jumlah'] += 1;
      });
    } else {
      if (maxStok < 1) {
        _showErrorSnackBar('Stok habis');
        return;
      }
      setState(() {
        _cartItems.add({
          'produkId': produk['id'],
          'nama': produk['nama'],
          'hargaSatuan': produk['hargaJual'],
          'jumlah': 1,
          'maxStok': maxStok,
          'gambarUrl': produk['gambarUrl']
        });
      });
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(LucideIcons.checkCircle2, color: AppColors.white),
            const SizedBox(width: 12),
            Expanded(child: Text('${produk['nama']} ditambahkan ke keranjang')),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        action: SnackBarAction(
          label: 'LIHAT',
          textColor: AppColors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _openCart();
          },
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  Future<void> _checkout() async {
    if (_cartItems.isEmpty) return;

    setState(() => _isLoading = true);
    Navigator.pop(context); // Close cart

    try {
      final response = await ApiService.post(
        Uri.parse('${ApiConfig.baseUrl}/toko/checkout'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'anggotaId': widget.anggotaId, // Default dummy anggota, or pass from widget
          'metodePembayaran': _selectedPaymentMethod,
          'items': _cartItems.map((c) => {
            'produkId': c['produkId'],
            'jumlah': c['jumlah']
          }).toList(),
        }),
      );

      if (response.statusCode == 201) {
        setState(() {
          _cartItems.clear();
        });
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Row(
              children: [
                Icon(LucideIcons.checkCircle2, color: AppColors.success),
                SizedBox(width: 8),
                Text('Pesanan Berhasil', style: TextStyle(color: AppColors.success, fontWeight: FontWeight.bold)),
              ],
            ),
            content: const Text('Pesanan Anda berhasil dibuat dan sedang menunggu verifikasi oleh Admin POS.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                child: const Text('OK', style: TextStyle(color: AppColors.white)),
              )
            ],
          ),
        );
        _fetchProduk(); // Refresh stok
      } else {
        final data = jsonDecode(response.body);
        _showErrorSnackBar(data['error'] ?? 'Gagal memproses checkout');
      }
    } catch (e) {
      _showErrorSnackBar('Koneksi bermasalah');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _openCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          double totalHarga = _cartItems.fold(0, (sum, item) => sum + (item['hargaSatuan'] * item['jumlah']));
          
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 16),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Keranjang Belanja', style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary)),
                      IconButton(
                        icon: const Icon(LucideIcons.x, color: AppColors.textMuted),
                        onPressed: () => Navigator.pop(ctx),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: _cartItems.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(LucideIcons.shoppingCart, size: 64, color: AppColors.textMuted.withOpacity(0.3)),
                            const SizedBox(height: 16),
                            const Text('Keranjang Anda kosong.', style: TextStyle(color: AppColors.textMuted)),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: _cartItems.length,
                        itemBuilder: (context, index) {
                          final item = _cartItems[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.surfaceColor),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60, height: 60,
                                  decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                                  child: const Icon(LucideIcons.package, color: AppColors.primary),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item['nama'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                      const SizedBox(height: 4),
                                      Text(formatRupiah(item['hargaSatuan']), style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(LucideIcons.minusCircle, color: AppColors.error),
                                      onPressed: () {
                                        setModalState(() {
                                          setState(() {
                                            if (item['jumlah'] > 1) {
                                              item['jumlah'] -= 1;
                                            } else {
                                              _cartItems.removeAt(index);
                                            }
                                          });
                                        });
                                      },
                                    ),
                                    Text('${item['jumlah']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    IconButton(
                                      icon: const Icon(LucideIcons.plusCircle, color: AppColors.primary),
                                      onPressed: () {
                                        if (item['jumlah'] >= item['maxStok']) {
                                          _showErrorSnackBar('Stok maksimal adalah ${item['maxStok']}');
                                          return;
                                        }
                                        setModalState(() {
                                          setState(() {
                                            item['jumlah'] += 1;
                                          });
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                ),
                if (_cartItems.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: _selectedPaymentMethod,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.surfaceColor)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.surfaceColor)),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'POTONG_SALDO', child: Text('Potong Saldo Sukarela')),
                            DropdownMenuItem(value: 'TRANSFER', child: Text('Transfer Bank')),
                            DropdownMenuItem(value: 'CASH', child: Text('Tunai (Ambil di Toko)')),
                          ],
                          onChanged: (val) {
                            if (val != null) {
                              setModalState(() => _selectedPaymentMethod = val);
                              setState(() => _selectedPaymentMethod = val);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Pembayaran', style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold)),
                            Text(formatRupiah(totalHarga), style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _checkout,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text('Buat Pesanan', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Toko Koperasi', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.white)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.history),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => RiwayatTokoScreen(anggotaId: widget.anggotaId)));
            },
            tooltip: 'Riwayat Toko',
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(LucideIcons.shoppingBag),
                onPressed: _openCart,
              ),
              if (_cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                    child: Text(
                      '${_cartItems.fold(0, (sum, i) => sum + (i['jumlah'] as int))}',
                      style: const TextStyle(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : _produkList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.packageOpen, size: 64, color: AppColors.textMuted.withOpacity(0.3)),
                      const SizedBox(height: 16),
                      const Text('Belum ada produk yang tersedia.', style: TextStyle(color: AppColors.textMuted)),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _fetchProduk,
                  color: AppColors.primary,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: _produkList.length,
                    itemBuilder: (context, index) {
                      final p = _produkList[index];
                      final imageUrl = p['gambarUrl'] != null && p['gambarUrl'].toString().isNotEmpty
                          ? '${ApiConfig.baseUrl.replaceAll('/api', '')}${p['gambarUrl']}'
                          : null;

                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.surfaceColor, width: 2),
                          boxShadow: [
                            BoxShadow(color: AppColors.primary.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                                child: imageUrl != null
                                    ? Image.network(
                                        imageUrl,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => _buildPlaceholderImage(),
                                      )
                                    : _buildPlaceholderImage(),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          p['nama'] ?? 'Produk',
                                          style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          formatRupiah(p['hargaJual']),
                                          style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 36,
                                      child: ElevatedButton(
                                        onPressed: () => _beliProduk(p),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.secondary,
                                          foregroundColor: AppColors.primary,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                        child: const Text('Beli', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: double.infinity,
      color: AppColors.primary.withOpacity(0.05),
      child: Center(
        child: Icon(LucideIcons.image, size: 40, color: AppColors.primary.withOpacity(0.3)),
      ),
    );
  }
}
