import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import '../config.dart';
import 'pengajuan_pinjaman_screen.dart';
import 'detail_pinjaman_screen.dart';

class PinjamanScreen extends StatefulWidget {
  final int anggotaId;
  const PinjamanScreen({super.key, required this.anggotaId});

  @override
  State<PinjamanScreen> createState() => _PinjamanScreenState();
}

class _PinjamanScreenState extends State<PinjamanScreen> {
  bool _isLoading = true;
  List<dynamic> _pinjamanList = [];
  double _totalSimpanan = 0;
  double _plafon = 0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() => _isLoading = true);
    try {
      // Fetch Dashboard for Plafon (total simpanan * 3 logic handled locally for display if needed, but we can fetch real plafon if API provides it)
      final resDash = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/dashboard/mobile/${widget.anggotaId}'));
      if (resDash.statusCode == 200) {
        final data = jsonDecode(resDash.body);
        _totalSimpanan = (data['totalSimpanan'] as num?)?.toDouble() ?? 0;
        _plafon = _totalSimpanan * 3; // Estimasi plafon (Bisa disesuaikan dengan setting backend)
      }

      // Fetch list pinjaman
      final resPinjaman = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/pinjaman/mobile/${widget.anggotaId}'));
      if (resPinjaman.statusCode == 200) {
        _pinjamanList = jsonDecode(resPinjaman.body);
      }
    } catch (e) {
      debugPrint('Error fetching pinjaman: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _formatRp(dynamic amount) {
    if (amount == null) return "Rp 0";
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Pinjaman Koperasi', style: GoogleFonts.outfit(color: AppColors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : RefreshIndicator(
              onRefresh: _fetchData,
              color: AppColors.primary,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPlafonCard(),
                    const SizedBox(height: 32),
                    Text(
                      'Pinjaman Aktif & Riwayat',
                      style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    const SizedBox(height: 16),
                    _pinjamanList.isEmpty
                        ? _buildEmptyState()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _pinjamanList.length,
                            itemBuilder: (context, index) {
                              return _buildPinjamanCard(_pinjamanList[index]);
                            },
                          ),
                    const SizedBox(height: 100), // padding for FAB
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => PengajuanPinjamanScreen(anggotaId: widget.anggotaId))).then((_) => _fetchData());
        },
        backgroundColor: AppColors.secondary,
        icon: const Icon(LucideIcons.fileSignature, color: AppColors.primary),
        label: const Text('Ajukan Pinjaman', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildPlafonCard() {
    // Sisa plafon dikurangi total sisa hutang (estimasi)
    double sisaHutang = 0;
    for (var p in _pinjamanList) {
      if (p['status'] == 'DICAIRKAN') {
        // hitung sisa angsuran yg belum bayar
        final angsuran = p['angsuran'] as List<dynamic>? ?? [];
        for (var a in angsuran) {
          if (a['status'] == 'BELUM_BAYAR') {
            sisaHutang += a['nominalPokok']; // Atau total tagihan, tergantung kebijakan
          }
        }
      } else if (p['status'] == 'PENDING_ADMIN' || p['status'] == 'PENDING_KETUA') {
         sisaHutang += p['nominal'];
      }
    }
    
    double plafonTersedia = _plafon - sisaHutang;
    if (plafonTersedia < 0) plafonTersedia = 0;
    
    final double percent = _plafon > 0 ? (plafonTersedia / _plafon) : 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceColor, width: 2),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Limit Pinjaman Tersedia', style: TextStyle(color: AppColors.textMuted, fontSize: 13, fontWeight: FontWeight.w500)),
              const Icon(LucideIcons.shieldCheck, color: AppColors.success, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _formatRp(plafonTersedia),
            style: GoogleFonts.outfit(color: AppColors.primary, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: AppColors.surfaceColor,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Maksimal Plafon: ${_formatRp(_plafon)}',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Icon(LucideIcons.fileX, size: 64, color: AppColors.textMuted.withOpacity(0.3)),
            const SizedBox(height: 16),
            const Text('Belum ada riwayat pinjaman', style: TextStyle(color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }

  Widget _buildPinjamanCard(dynamic pinjaman) {
    final status = pinjaman['status'];
    final nominal = pinjaman['nominal'];
    final tenor = pinjaman['tenor'];
    final date = DateTime.parse(pinjaman['createdAt']);
    
    // Status Badge Setup
    Color statusColor = AppColors.warning;
    IconData statusIcon = LucideIcons.clock;
    String statusText = status.replaceAll('_', ' ');

    if (status == 'DICAIRKAN') {
      statusColor = AppColors.primary;
      statusIcon = LucideIcons.checkCircle;
      statusText = 'AKTIF';
    } else if (status == 'LUNAS') {
      statusColor = AppColors.success;
      statusIcon = LucideIcons.checkCheck;
    } else if (status == 'DITOLAK') {
      statusColor = AppColors.error;
      statusIcon = LucideIcons.xCircle;
    }

    // Progress if AKTIF
    int cicilanTerbayar = 0;
    if (status == 'DICAIRKAN' || status == 'LUNAS') {
       final angsuran = pinjaman['angsuran'] as List<dynamic>? ?? [];
       cicilanTerbayar = angsuran.where((a) => a['status'] == 'LUNAS').length;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPinjamanScreen(pinjaman: pinjaman)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.surfaceColor, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd MMM yyyy').format(date),
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, size: 12, color: statusColor),
                      const SizedBox(width: 4),
                      Text(statusText, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Pinjaman Tunai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(_formatRp(nominal), style: GoogleFonts.outfit(fontSize: 18, color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Tenor', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text('$tenor Bulan', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                ),
              ],
            ),
            
            if (status == 'DICAIRKAN') ...[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Progress Cicilan', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  Text('$cicilanTerbayar / $tenor', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primary)),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: cicilanTerbayar / tenor,
                  backgroundColor: AppColors.surfaceColor,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  minHeight: 6,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
