import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../theme/colors.dart';
import '../config.dart';

class AngsuranScreen extends StatefulWidget {
  final int anggotaId;
  const AngsuranScreen({super.key, required this.anggotaId});

  @override
  State<AngsuranScreen> createState() => _AngsuranScreenState();
}

class _AngsuranScreenState extends State<AngsuranScreen> {
  List<dynamic> _angsuranList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAngsuran();
  }

  Future<void> _fetchAngsuran() async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/pinjaman/angsuran'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        
        // Filter data berdasarkan anggotaId yang sedang login
        final filteredData = data.where((item) {
          final pinjaman = item['pinjaman'];
          if (pinjaman != null && pinjaman['anggotaId'] != null) {
            return pinjaman['anggotaId'].toString() == widget.anggotaId.toString();
          }
          return false;
        }).toList();

        setState(() {
          _angsuranList = filteredData;
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      print('Error fetching angsuran: $e');
      setState(() => _isLoading = false);
    }
  }

  void _payAngsuran(int id) {
    // Implementasi mockup bayar
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pembayaran', style: TextStyle(color: AppColors.primary)),
        content: const Text('Fitur integrasi payment gateway sedang dalam pengembangan. Pembayaran akan diarahkan ke transfer manual.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup'),
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
        title: Text('Bayar Angsuran', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _angsuranList.isEmpty
              ? const Center(child: Text('Tidak ada tagihan angsuran saat ini.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _angsuranList.length,
                  itemBuilder: (context, index) {
                    final item = _angsuranList[index];
                    final nominal = item['totalTagihan'] ?? 0;
                    final bulanKe = item['bulanKe'] ?? 0;
                    final status = item['status'] ?? 'BELUM_BAYAR';

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(LucideIcons.calendar, color: Colors.orange),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Angsuran Bulan ke-$bulanKe',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Tagihan: Rp $nominal',
                                    style: TextStyle(color: AppColors.textMuted, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            if (status == 'BELUM_BAYAR')
                              ElevatedButton(
                                onPressed: () => _payAngsuran(item['id']),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary,
                                  foregroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text('Bayar'),
                              )
                            else
                              const Text('LUNAS', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
