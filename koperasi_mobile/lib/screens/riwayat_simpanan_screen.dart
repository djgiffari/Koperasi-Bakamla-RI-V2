import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../theme/colors.dart';
import '../config.dart';
import 'package:intl/intl.dart';

class RiwayatSimpananScreen extends StatefulWidget {
  final int anggotaId;
  const RiwayatSimpananScreen({super.key, required this.anggotaId});

  @override
  State<RiwayatSimpananScreen> createState() => _RiwayatSimpananScreenState();
}

class _RiwayatSimpananScreenState extends State<RiwayatSimpananScreen> {
  List<dynamic> _riwayat = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRiwayat();
  }

  Future<void> _fetchRiwayat() async {
    try {
      final res = await http.get(Uri.parse('${ApiConfig.baseUrl}/simpanan/riwayat/${widget.anggotaId}'));
      if (res.statusCode == 200) {
        setState(() {
          _riwayat = jsonDecode(res.body);
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      print('Error fetching riwayat: $e');
      setState(() => _isLoading = false);
    }
  }

  String formatRupiah(dynamic number) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(number);
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'DISETUJUI':
        return Colors.green;
      case 'DITOLAK':
        return Colors.red;
      case 'MENUNGGU_VERIFIKASI':
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Riwayat Simpanan', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _riwayat.isEmpty
              ? const Center(child: Text('Belum ada riwayat setoran simpanan.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: _riwayat.length,
                  itemBuilder: (context, index) {
                    final item = _riwayat[index];
                    final date = DateTime.parse(item['createdAt']);
                    final formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(date);
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => _showDetailModal(item, formattedDate),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  item['jenisMutasi'] == 'SETORAN' ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['jenisSimpanan'],
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      formattedDate,
                                      style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    formatRupiah(item['nominal']),
                                    style: GoogleFonts.outfit(
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 16,
                                      color: item['jenisMutasi'] == 'SETORAN' ? Colors.green : Colors.red,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: _getStatusColor(item['status']).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      item['status'].replaceAll('_', ' '),
                                      style: TextStyle(
                                        color: _getStatusColor(item['status']),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  void _showDetailModal(dynamic item, String formattedDate) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'Detail Transaksi',
                style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _buildDetailRow('Jenis Transaksi', item['jenisMutasi'] == 'SETORAN' ? 'Setoran Simpanan' : 'Penarikan Simpanan'),
              _buildDetailRow('Kategori', item['jenisSimpanan']),
              _buildDetailRow('Nominal', formatRupiah(item['nominal']), isBold: true, isAmount: true, isSetoran: item['jenisMutasi'] == 'SETORAN'),
              _buildDetailRow('Tanggal', formattedDate),
              _buildDetailRow('Keterangan', item['keterangan'] ?? '-'),
              _buildDetailRow('Status', item['status'].replaceAll('_', ' '), isStatus: true),
              if (item['buktiUrl'] != null) ...[
                const SizedBox(height: 16),
                const Text('Bukti Transaksi', style: TextStyle(color: AppColors.textMuted)),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '${ApiConfig.baseUrl.replaceAll('/api', '')}${item['buktiUrl']}',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: const Center(child: Icon(LucideIcons.imageOff, color: Colors.grey)),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false, bool isAmount = false, bool isSetoran = false, bool isStatus = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textMuted)),
          isStatus
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(value.replaceAll(' ', '_')).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: _getStatusColor(value.replaceAll(' ', '_')),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Text(
                  value,
                  style: GoogleFonts.outfit(
                    fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                    fontSize: isAmount ? 18 : 14,
                    color: isAmount ? (isSetoran ? Colors.green : Colors.red) : AppColors.textMain,
                  ),
                ),
        ],
      ),
    );
  }
}
