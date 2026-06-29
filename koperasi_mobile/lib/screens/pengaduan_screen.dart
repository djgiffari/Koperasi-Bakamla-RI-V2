import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import '../config.dart';

class PengaduanScreen extends StatefulWidget {
  final int anggotaId;
  const PengaduanScreen({super.key, required this.anggotaId});

  @override
  State<PengaduanScreen> createState() => _PengaduanScreenState();
}

class _PengaduanScreenState extends State<PengaduanScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // Form State
  final _subjekController = TextEditingController();
  final _deskripsiController = TextEditingController();
  String _kategori = 'UMUM';
  PlatformFile? _lampiranFile;
  bool _isSubmitting = false;

  // History State
  List<dynamic> _riwayat = [];
  bool _isLoadingHistory = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchRiwayat();
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    _subjekController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  Future<void> _fetchRiwayat() async {
    setState(() => _isLoadingHistory = true);
    try {
      final res = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/pengaduan/mobile/${widget.anggotaId}'));
      if (res.statusCode == 200) {
        if (mounted) setState(() => _riwayat = jsonDecode(res.body));
      }
    } catch (e) {
      debugPrint('Error fetching pengaduan history: $e');
    } finally {
      if (mounted) setState(() => _isLoadingHistory = false);
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );
    if (result != null) {
      setState(() {
        _lampiranFile = result.files.first;
      });
    }
  }

  Future<void> _submitPengaduan() async {
    if (_subjekController.text.isEmpty || _deskripsiController.text.isEmpty) {
      _showDialog('Error', 'Harap isi Subjek dan Deskripsi pengaduan');
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      var request = http.MultipartRequest('POST', Uri.parse('${ApiConfig.baseUrl}/pengaduan'));
      ApiService.addAuthHeaderToMultipart(request);
      request.fields['anggotaId'] = widget.anggotaId.toString();
      request.fields['kategori'] = _kategori;
      request.fields['subjek'] = _subjekController.text;
      request.fields['deskripsi'] = _deskripsiController.text;

      if (_lampiranFile != null && _lampiranFile!.path != null) {
        request.files.add(await http.MultipartFile.fromPath('lampiranFile', _lampiranFile!.path!));
      }

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        _showDialog('Sukses', 'Tiket pengaduan berhasil dikirim', isSuccess: true);
        _subjekController.clear();
        _deskripsiController.clear();
        setState(() => _lampiranFile = null);
        _fetchRiwayat();
        _tabController.animateTo(1); // Pindah ke tab riwayat
      } else {
        var responseData = await response.stream.bytesToString();
        _showDialog('Gagal', 'Terjadi kesalahan: $responseData');
      }
    } catch (e) {
      debugPrint('Error submit pengaduan: $e');
      _showDialog('Error', 'Gagal mengirim pengaduan. Periksa koneksi Anda.');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showDialog(String title, String message, {bool isSuccess = false}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(isSuccess ? LucideIcons.checkCircle2 : LucideIcons.alertCircle, color: isSuccess ? AppColors.success : AppColors.error),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(color: isSuccess ? AppColors.success : AppColors.error, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(message),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK', style: TextStyle(color: AppColors.white)),
          )
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'SELESAI': return AppColors.success;
      case 'DIPROSES': return Colors.blue;
      default: return AppColors.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Pengaduan & Bantuan', style: GoogleFonts.outfit(color: AppColors.white, fontWeight: FontWeight.bold)),
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
            Tab(text: 'Buat Tiket Baru'),
            Tab(text: 'Riwayat Pengaduan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildForm(),
          _buildRiwayat(),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withOpacity(0.2)),
            ),
            child: const Row(
              children: [
                Icon(LucideIcons.headset, color: Colors.blue),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tim Support kami akan merespon tiket Anda maksimal 2x24 jam kerja.',
                    style: TextStyle(color: Colors.blue, fontSize: 13),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          const Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.surfaceColor),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _kategori,
                isExpanded: true,
                items: ['UMUM', 'SIMPANAN', 'PINJAMAN', 'SISTEM'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _kategori = val);
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('Subjek', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          TextField(
            controller: _subjekController,
            decoration: InputDecoration(
              hintText: 'Cth: Kesalahan data simpanan',
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('Deskripsi Masalah', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          TextField(
            controller: _deskripsiController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Jelaskan masalah Anda secara detail...',
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('Lampiran Bukti (Opsional)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _pickFile,
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _lampiranFile != null ? AppColors.success : AppColors.surfaceColor, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_lampiranFile != null ? LucideIcons.checkCircle2 : LucideIcons.uploadCloud, color: _lampiranFile != null ? AppColors.success : AppColors.primary, size: 28),
                  const SizedBox(height: 8),
                  Text(
                    _lampiranFile != null ? _lampiranFile!.name : 'Upload Foto/PDF (Maks 2MB)',
                    style: TextStyle(
                      color: _lampiranFile != null ? AppColors.success : AppColors.textMuted, 
                      fontSize: 12,
                      fontWeight: _lampiranFile != null ? FontWeight.bold : FontWeight.normal
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isSubmitting ? null : _submitPengaduan,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: _isSubmitting
                  ? const CircularProgressIndicator(color: AppColors.white)
                  : const Text('Kirim Pengaduan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRiwayat() {
    if (_isLoadingHistory) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }
    if (_riwayat.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.messageSquare, size: 64, color: AppColors.textMuted.withOpacity(0.3)),
            const SizedBox(height: 16),
            const Text('Anda belum memiliki riwayat pengaduan.', style: TextStyle(color: AppColors.textMuted)),
          ],
        ),
      );
    }
    
    return RefreshIndicator(
      onRefresh: _fetchRiwayat,
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _riwayat.length,
        itemBuilder: (context, index) {
          final item = _riwayat[index];
          final date = DateTime.parse(item['createdAt']);
          final statusColor = _getStatusColor(item['status']);
          
          return Container(
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
                      'Ticket #${item['id']}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textMuted),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item['status'].replaceAll('_', ' '),
                        style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  item['subjek'],
                  style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary),
                ),
                const SizedBox(height: 4),
                Text(
                  item['deskripsi'],
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12, height: 1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(LucideIcons.calendarClock, size: 14, color: AppColors.textMuted),
                    const SizedBox(width: 4),
                    Text(
                      DateFormat('dd MMM yyyy, HH:mm').format(date),
                      style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
                    ),
                  ],
                ),
                if (item['balasanAdmin'] != null) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(height: 1),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primaryLight.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(LucideIcons.shieldCheck, size: 14, color: AppColors.primary),
                            SizedBox(width: 6),
                            Text('Balasan Admin', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['balasanAdmin'],
                          style: const TextStyle(color: AppColors.textMain, fontSize: 12, height: 1.4),
                        ),
                      ],
                    ),
                  )
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}
