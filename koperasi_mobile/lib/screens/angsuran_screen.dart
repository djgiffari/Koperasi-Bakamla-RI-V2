import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import '../config.dart';

class AngsuranScreen extends StatefulWidget {
  final int anggotaId;
  const AngsuranScreen({super.key, required this.anggotaId});

  @override
  State<AngsuranScreen> createState() => _AngsuranScreenState();
}

class _AngsuranScreenState extends State<AngsuranScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> _tagihanBelumBayar = [];
  List<dynamic> _riwayatBayar = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchAngsuran();
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _fetchAngsuran() async {
    setState(() => _isLoading = true);
    try {
      final response = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/pinjaman/mobile/${widget.anggotaId}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        
        List<dynamic> belumBayar = [];
        List<dynamic> sudahBayar = [];
        
        for (var pinjaman in data) {
          if (pinjaman['status'] == 'DICAIRKAN' || pinjaman['status'] == 'LUNAS') {
            final angsuranList = pinjaman['angsuran'] as List<dynamic>? ?? [];
            for (var a in angsuranList) {
              // Tambahkan info nama pinjaman agar tahu ini cicilan apa
              a['pinjamanNominal'] = pinjaman['nominal'];
              a['pinjamanTenor'] = pinjaman['tenor'];
              
              if (a['status'] == 'LUNAS') {
                sudahBayar.add(a);
              } else {
                belumBayar.add(a);
              }
            }
          }
        }
        
        // Urutkan belum bayar dari yang terdekat jatuh tempo
        belumBayar.sort((a, b) => DateTime.parse(a['jatuhTempo']).compareTo(DateTime.parse(b['jatuhTempo'])));
        // Urutkan sudah bayar dari yang terbaru lunas (karena mockup pakai jatuhTempo sebagai marker)
        sudahBayar.sort((a, b) => DateTime.parse(b['jatuhTempo']).compareTo(DateTime.parse(a['jatuhTempo'])));

        if (mounted) {
          setState(() {
            _tagihanBelumBayar = belumBayar;
            _riwayatBayar = sudahBayar;
            _isLoading = false;
          });
        }
      } else {
        if (mounted) setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint('Error fetching angsuran: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _formatRp(dynamic amount) {
    if (amount == null) return "Rp 0";
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(amount);
  }

  void _payAngsuran(dynamic tagihan) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            const Icon(LucideIcons.banknote, color: AppColors.primary),
            const SizedBox(width: 8),
            Text('Bayar Angsuran', style: GoogleFonts.outfit(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(
          'Total tagihan bulan ke-${tagihan['bulanKe']} sebesar ${_formatRp(tagihan['totalTagihan'])}.\n\nPembayaran saat ini diarahkan ke Transfer Manual via Bank. Anda yakin ingin melanjutkan?',
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: AppColors.textMuted)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Permintaan pembayaran dikirim. Silakan cek Inbox untuk detail transfer.')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: const Text('Lanjutkan', style: TextStyle(color: AppColors.white)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Angsuran Pinjaman', style: GoogleFonts.outfit(color: AppColors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.secondary,
          indicatorWeight: 3,
          labelColor: AppColors.secondary,
          unselectedLabelColor: AppColors.white.withOpacity(0.6),
          labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 14),
          tabs: const [
            Tab(text: 'Tagihan'),
            Tab(text: 'Riwayat Bayar'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : TabBarView(
              controller: _tabController,
              children: [
                _buildTagihanList(),
                _buildRiwayatList(),
              ],
            ),
    );
  }

  Widget _buildTagihanList() {
    if (_tagihanBelumBayar.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.checkCircle2, size: 64, color: AppColors.success.withOpacity(0.3)),
            const SizedBox(height: 16),
            const Text('Hore! Tidak ada tagihan angsuran saat ini.', style: TextStyle(color: AppColors.textMuted)),
          ],
        ),
      );
    }
    
    return RefreshIndicator(
      onRefresh: _fetchAngsuran,
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _tagihanBelumBayar.length,
        itemBuilder: (context, index) {
          final item = _tagihanBelumBayar[index];
          final date = DateTime.parse(item['jatuhTempo']);
          
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.error.withOpacity(0.3), width: 1.5),
              boxShadow: [
                BoxShadow(color: AppColors.primary.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.05),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(LucideIcons.calendarClock, color: AppColors.error, size: 16),
                          const SizedBox(width: 8),
                          Text('Jatuh Tempo: ${DateFormat('dd MMM yyyy').format(date)}', style: const TextStyle(color: AppColors.error, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: AppColors.error, borderRadius: BorderRadius.circular(8)),
                        child: const Text('Belum Bayar', style: TextStyle(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pinjaman ${_formatRp(item['pinjamanNominal'])}', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text('Angsuran ke-${item['bulanKe']}', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary)),
                            const SizedBox(height: 8),
                            Text(_formatRp(item['totalTagihan']), style: GoogleFonts.outfit(color: AppColors.primary, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _payAngsuran(item),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: AppColors.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Bayar', style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRiwayatList() {
    if (_riwayatBayar.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.history, size: 64, color: AppColors.textMuted.withOpacity(0.3)),
            const SizedBox(height: 16),
            const Text('Belum ada riwayat pembayaran.', style: TextStyle(color: AppColors.textMuted)),
          ],
        ),
      );
    }
    
    return RefreshIndicator(
      onRefresh: _fetchAngsuran,
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _riwayatBayar.length,
        itemBuilder: (context, index) {
          final item = _riwayatBayar[index];
          
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.surfaceColor, width: 2),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(LucideIcons.checkCircle2, color: AppColors.success, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Angsuran ke-${item['bulanKe']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.primary)),
                      const SizedBox(height: 2),
                      Text('Pinjaman ${_formatRp(item['pinjamanNominal'])}', style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_formatRp(item['totalTagihan']), style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.success)),
                    const SizedBox(height: 2),
                    const Text('Lunas', style: TextStyle(color: AppColors.success, fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
