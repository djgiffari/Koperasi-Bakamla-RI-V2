import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:intl/intl.dart';

import '../theme/colors.dart';

class DetailPinjamanScreen extends StatelessWidget {
  final Map<String, dynamic> pinjaman;

  const DetailPinjamanScreen({super.key, required this.pinjaman});

  String _formatRp(dynamic amount) {
    if (amount == null) return "Rp 0";
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final status = pinjaman['status'];
    final nominal = pinjaman['nominal'];
    final tenor = pinjaman['tenor'];
    final date = DateTime.parse(pinjaman['createdAt']);
    final angsuran = pinjaman['angsuran'] as List<dynamic>? ?? [];

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

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Detail Pinjaman', style: GoogleFonts.outfit(color: AppColors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Card
            Container(
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
                      Text(
                        'Tanggal Pengajuan:\n${DateFormat('dd MMM yyyy, HH:mm').format(date)}',
                        style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(statusIcon, size: 14, color: statusColor),
                            const SizedBox(width: 6),
                            Text(statusText, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Nominal Pinjaman', style: TextStyle(color: AppColors.textMuted, fontSize: 13, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Text(
                    _formatRp(nominal),
                    style: GoogleFonts.outfit(color: AppColors.primary, fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tenor', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                          const SizedBox(height: 4),
                          Text('$tenor Bulan', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Bunga (Flat)', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                          const SizedBox(height: 4),
                          Text('${pinjaman['bungaPersen']}% / Bulan', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            if (angsuran.isNotEmpty) ...[
              const SizedBox(height: 32),
              Text(
                'Jadwal Angsuran',
                style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              ...angsuran.map((a) {
                final isLunas = a['status'] == 'LUNAS';
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: isLunas ? AppColors.success.withOpacity(0.3) : AppColors.surfaceColor, width: 2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isLunas ? AppColors.success.withOpacity(0.1) : AppColors.primary.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${a['bulanKe']}',
                          style: TextStyle(
                            color: isLunas ? AppColors.success : AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _formatRp(a['totalTagihan']),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Jatuh Tempo: ${DateFormat('dd MMM yyyy').format(DateTime.parse(a['jatuhTempo']))}',
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      if (isLunas)
                        const Icon(LucideIcons.checkCircle2, color: AppColors.success, size: 24)
                      else
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('Belum Bayar', style: TextStyle(color: AppColors.warning, fontSize: 10, fontWeight: FontWeight.bold)),
                        )
                    ],
                  ),
                );
              }),
            ]
          ],
        ),
      ),
    );
  }
}
