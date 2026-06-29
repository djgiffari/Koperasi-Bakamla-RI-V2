import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import '../config.dart';

class ShuScreen extends StatefulWidget {
  final int anggotaId;
  const ShuScreen({super.key, required this.anggotaId});

  @override
  State<ShuScreen> createState() => _ShuScreenState();
}

class _ShuScreenState extends State<ShuScreen> {
  Map<String, dynamic>? _shuData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchShuData();
  }

  Future<void> _fetchShuData() async {
    setState(() => _isLoading = true);
    try {
      final res = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/shu/estimasi/${widget.anggotaId}'));
      if (res.statusCode == 200) {
        if (mounted) setState(() => _shuData = jsonDecode(res.body));
      }
    } catch (e) {
      debugPrint('Error fetching SHU: $e');
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
        title: Text('Sisa Hasil Usaha', style: GoogleFonts.outfit(color: AppColors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : RefreshIndicator(
              onRefresh: _fetchShuData,
              color: AppColors.primary,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShuHero(),
                    const SizedBox(height: 32),
                    Text('Rincian SHU', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
                    const SizedBox(height: 16),
                    _buildRincian(),
                    const SizedBox(height: 32),
                    _buildInfoBox(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildShuHero() {
    final total = _shuData != null ? _shuData!['estimasiTotalShu'] : 0;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppColors.secondary.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(LucideIcons.coins, color: AppColors.white, size: 40),
          ),
          const SizedBox(height: 16),
          Text(
            'Estimasi Total SHU 2026',
            style: TextStyle(color: AppColors.white.withOpacity(0.9), fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            _formatRp(total),
            style: GoogleFonts.outfit(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(LucideIcons.checkCircle2, color: AppColors.white, size: 16),
              const SizedBox(width: 8),
              Text(
                'Dihitung berdasarkan proporsi kontribusi',
                style: TextStyle(color: AppColors.white.withOpacity(0.9), fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRincian() {
    final modal = _shuData != null ? _shuData!['bagianJasaModal'] : 0;
    final anggota = _shuData != null ? _shuData!['bagianJasaAnggota'] : 0;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceColor, width: 2),
      ),
      child: Column(
        children: [
          _buildDetailRow(
            icon: LucideIcons.wallet,
            color: AppColors.success,
            title: 'Jasa Modal (Simpanan)',
            subtitle: 'Proporsi simpanan terhadap total modal',
            amount: modal,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1),
          ),
          _buildDetailRow(
            icon: LucideIcons.shoppingBag,
            color: Colors.blue,
            title: 'Jasa Anggota',
            subtitle: 'Proporsi pinjaman & belanja toko',
            amount: anggota,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({required IconData icon, required Color color, required String title, required String subtitle, required dynamic amount}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
            ],
          ),
        ),
        Text(
          _formatRp(amount),
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(LucideIcons.info, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Sisa Hasil Usaha (SHU) dibagikan setiap akhir tahun buku setelah Rapat Anggota Tahunan (RAT). Estimasi ini dapat berubah sesuai dengan total keuntungan bersih Koperasi.',
              style: TextStyle(color: AppColors.primary.withOpacity(0.8), fontSize: 12, height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
