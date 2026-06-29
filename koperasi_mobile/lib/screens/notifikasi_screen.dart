import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import '../theme/colors.dart';
import '../config.dart';

class NotifikasiScreen extends StatefulWidget {
  final int anggotaId;

  const NotifikasiScreen({super.key, required this.anggotaId});

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  List<dynamic> _notifikasiSemua = [];
  List<dynamic> _notifikasiBelumDibaca = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchNotifikasi();
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _fetchNotifikasi() async {
    setState(() => _isLoading = true);
    try {
      final response = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/notifikasi/${widget.anggotaId}'));
      if (response.statusCode == 200) {
        if (mounted) {
          final List<dynamic> data = json.decode(response.body);
          setState(() {
            _notifikasiSemua = data;
            _notifikasiBelumDibaca = data.where((n) => n['isRead'] == false).toList();
            _isLoading = false;
          });
        }
      } else {
        throw Exception('Gagal memuat notifikasi');
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Koneksi terputus. Gagal memuat notifikasi.')),
        );
      }
    }
  }

  Future<void> _markAsRead(int id) async {
    try {
      final response = await ApiService.put(Uri.parse('${ApiConfig.baseUrl}/notifikasi/$id/read'));
      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            final indexSemua = _notifikasiSemua.indexWhere((n) => n['id'] == id);
            if (indexSemua != -1) _notifikasiSemua[indexSemua]['isRead'] = true;
            _notifikasiBelumDibaca.removeWhere((n) => n['id'] == id);
          });
        }
      }
    } catch (e) {
      debugPrint('Failed to mark as read: $e');
    }
  }

  Future<void> _markAllAsRead() async {
    try {
      final response = await ApiService.put(Uri.parse('${ApiConfig.baseUrl}/notifikasi/read-all/${widget.anggotaId}'));
      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            for (var n in _notifikasiSemua) {
              n['isRead'] = true;
            }
            _notifikasiBelumDibaca.clear();
          });
        }
      }
    } catch (e) {
      debugPrint('Failed to mark all as read: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text(
          'Notifikasi',
          style: GoogleFonts.outfit(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (_notifikasiBelumDibaca.isNotEmpty)
            IconButton(
              icon: const Icon(LucideIcons.checkCheck, color: AppColors.white),
              tooltip: 'Tandai Semua Dibaca',
              onPressed: _markAllAsRead,
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.secondary,
          indicatorWeight: 3,
          labelColor: AppColors.secondary,
          unselectedLabelColor: AppColors.white.withOpacity(0.6),
          labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 14),
          tabs: [
            const Tab(text: 'Semua'),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum Dibaca'),
                  if (_notifikasiBelumDibaca.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                      child: Text(
                        '${_notifikasiBelumDibaca.length}',
                        style: const TextStyle(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : TabBarView(
              controller: _tabController,
              children: [
                _buildNotificationList(_notifikasiSemua, 'Belum ada notifikasi.'),
                _buildNotificationList(_notifikasiBelumDibaca, 'Tidak ada notifikasi baru.'),
              ],
            ),
    );
  }

  Widget _buildNotificationList(List<dynamic> items, String emptyMessage) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 20, spreadRadius: 5)
                ],
              ),
              child: const Icon(LucideIcons.bellOff, size: 64, color: AppColors.textMuted),
            ),
            const SizedBox(height: 24),
            Text(
              emptyMessage,
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textMain),
            ),
          ],
        ),
      );
    }
    
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: _fetchNotifikasi,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final bool isRead = item['isRead'];
          return _buildNotificationItem(item, isRead);
        },
      ),
    );
  }

  Widget _buildNotificationItem(dynamic item, bool isRead) {
    String timeAgo = 'Baru saja';
    if (item['createdAt'] != null) {
      try {
        final date = DateTime.parse(item['createdAt']);
        final diff = DateTime.now().difference(date);
        if (diff.inDays > 0) {
          timeAgo = '${diff.inDays} hari lalu';
        } else if (diff.inHours > 0) {
          timeAgo = '${diff.inHours} jam lalu';
        } else if (diff.inMinutes > 0) {
          timeAgo = '${diff.inMinutes} mnt lalu';
        }
      } catch (e) {
        timeAgo = '-';
      }
    }

    // Tentukan warna icon berdasarkan kata kunci judul
    Color iconColor = AppColors.primary;
    IconData iconData = LucideIcons.bell;
    final judulLower = (item['judul'] ?? '').toString().toLowerCase();

    if (judulLower.contains('tolak') || judulLower.contains('gagal')) {
      iconColor = AppColors.error;
      iconData = LucideIcons.xCircle;
    } else if (judulLower.contains('setuju') || judulLower.contains('berhasil') || judulLower.contains('lunas') || judulLower.contains('cair')) {
      iconColor = AppColors.success;
      iconData = LucideIcons.checkCircle2;
    } else if (judulLower.contains('peringatan') || judulLower.contains('jatuh tempo')) {
      iconColor = AppColors.warning;
      iconData = LucideIcons.alertTriangle;
    }

    return InkWell(
      onTap: () {
        if (!isRead) _markAsRead(item['id']);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isRead ? AppColors.white : AppColors.primary.withOpacity(0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isRead ? AppColors.surfaceColor : AppColors.primary.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isRead ? AppColors.surfaceColor : iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData, 
                size: 20, 
                color: isRead ? AppColors.textMuted : iconColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['judul'] ?? 'Pengumuman',
                          style: TextStyle(
                            fontWeight: isRead ? FontWeight.bold : FontWeight.w800,
                            color: isRead ? AppColors.textMain : AppColors.primary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      if (!isRead)
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: const BoxDecoration(
                            color: AppColors.error,
                            shape: BoxShape.circle,
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['pesan'] ?? '',
                    style: TextStyle(
                      color: isRead ? AppColors.textMuted : AppColors.textMain,
                      height: 1.4,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    timeAgo,
                    style: TextStyle(color: AppColors.textMuted.withOpacity(0.7), fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
