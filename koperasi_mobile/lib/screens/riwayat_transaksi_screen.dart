import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import '../config.dart';

class RiwayatTransaksiScreen extends StatefulWidget {
  final int anggotaId;
  const RiwayatTransaksiScreen({super.key, required this.anggotaId});

  @override
  State<RiwayatTransaksiScreen> createState() => _RiwayatTransaksiScreenState();
}

class _RiwayatTransaksiScreenState extends State<RiwayatTransaksiScreen> {
  List<dynamic> _riwayat = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRiwayat();
  }

  Future<void> _fetchRiwayat() async {
    setState(() => _isLoading = true);
    try {
      final res = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/transaksi/riwayat/${widget.anggotaId}'));
      if (res.statusCode == 200) {
        if (mounted) {
          setState(() {
            _riwayat = jsonDecode(res.body);
            _isLoading = false;
          });
        }
      } else {
        if (mounted) setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint('Error fetching riwayat transaksi: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String formatRupiah(dynamic number) {
    if (number == null) return "Rp 0";
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(number);
  }

  Color _getStatusColor(String status) {
    if (status.contains('SETUJU') || status == 'LUNAS' || status == 'DICAIRKAN') return AppColors.success;
    if (status.contains('TOLAK') || status.contains('GAGAL')) return AppColors.error;
    return AppColors.warning;
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'SIMPANAN': return LucideIcons.piggyBank;
      case 'PINJAMAN': return LucideIcons.banknote;
      case 'ANGSURAN': return LucideIcons.calculator;
      case 'TOKO': return LucideIcons.shoppingBag;
      default: return LucideIcons.wallet;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Riwayat Transaksi', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.white)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : _riwayat.isEmpty
              ? const Center(child: Text('Belum ada riwayat transaksi.', style: TextStyle(color: AppColors.textMuted)))
              : RefreshIndicator(
                  onRefresh: _fetchRiwayat,
                  color: AppColors.primary,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: _riwayat.length,
                    itemBuilder: (context, index) {
                      final item = _riwayat[index];
                      final date = DateTime.parse(item['tanggal']);
                      final judul = item['judul'] ?? 'Transaksi';
                      final jenis = item['jenis'] ?? 'masuk';
                      final isMasuk = jenis == 'masuk';
                      final nominal = item['nominal'] as num;

                      return InkWell(
                        onTap: () => _showTransactionDetail(item),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.surfaceColor, width: 2),
                            boxShadow: [
                              BoxShadow(color: AppColors.primary.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
                            ],
                          ),
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.05),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(isMasuk ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight, color: AppColors.primary),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  const SizedBox(height: 4),
                                  Text(
                                    DateFormat('dd MMM yyyy, HH:mm').format(date),
                                    style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '${isMasuk ? '+' : '-'} ${formatRupiah(nominal)}',
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.bold, 
                                fontSize: 14,
                                color: isMasuk ? AppColors.success : AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ));
                    },
                  ),
                ),
    );
  }

  void _showTransactionDetail(dynamic item) {
    final date = DateTime.parse(item['tanggal']);
    final judul = item['judul'] ?? 'Transaksi';
    final jenis = item['jenis'] ?? 'masuk';
    final isMasuk = jenis == 'masuk';
    final nominal = item['nominal'] as num;
    final String id = item['id'].toString();
    final String status = item['status']?.toString() ?? 'SELESAI';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isMasuk ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isMasuk ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
                color: isMasuk ? AppColors.success : AppColors.error,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${isMasuk ? '+' : '-'} ${formatRupiah(nominal)}',
              style: GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.bold, color: isMasuk ? AppColors.success : AppColors.error),
            ),
            const SizedBox(height: 8),
            Text(judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary), textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.surfaceColor),
              ),
              child: Column(
                children: [
                  _detailRow('Status', status, isStatus: true),
                  const Divider(height: 24, color: AppColors.surfaceColor),
                  _detailRow('ID Transaksi', id.toUpperCase()),
                  const Divider(height: 24, color: AppColors.surfaceColor),
                  _detailRow('Tanggal', DateFormat('dd MMMM yyyy, HH:mm').format(date)),
                  const Divider(height: 24, color: AppColors.surfaceColor),
                  _detailRow('Jenis', isMasuk ? 'Pemasukan' : 'Pengeluaran'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Tutup', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value, {bool isStatus = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
        isStatus
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: Text(value, style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 12)),
              )
            : Flexible(
                child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary), textAlign: TextAlign.right),
              ),
      ],
    );
  }
}
