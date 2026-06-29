import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../theme/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import 'package:intl/intl.dart';

import 'menu_screens.dart';
import 'notifikasi_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';
import 'simpanan_screen.dart';
import 'pinjaman_screen.dart';
import 'angsuran_screen.dart';
import 'shu_screen.dart';
import 'riwayat_transaksi_screen.dart';
import 'pengajuan_pinjaman_screen.dart';
import 'pengaduan_screen.dart';
import '../config.dart';

class DashboardScreen extends StatefulWidget {
  final int anggotaId;
  final String? namaLengkap;
  final bool isDefaultPassword;
  
  const DashboardScreen({
    super.key,
    required this.anggotaId,
    this.namaLengkap,
    this.isDefaultPassword = false,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool _isBalanceHidden = false;
  
  Map<String, dynamic>? _dashboardData;
  int _unreadNotifikasi = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDashboardData();
    _fetchUnreadNotifikasi();
  }

  Future<void> _fetchUnreadNotifikasi() async {
    try {
      final response = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/notifikasi/unread/${widget.anggotaId}'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (mounted) setState(() => _unreadNotifikasi = data['count'] ?? 0);
      }
    } catch (e) {
      debugPrint('Failed to fetch unread notifikasi: $e');
    }
  }

  Future<void> _fetchDashboardData() async {
    final aId = widget.anggotaId;
    try {
      setState(() => _isLoading = true);
      final res = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/dashboard/mobile/$aId'));
      if (res.statusCode == 200) {
        if (mounted) {
          setState(() {
            _dashboardData = jsonDecode(res.body);
            _isLoading = false;
          });
        }
      } else {
        if (mounted) setState(() => _isLoading = false);
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _formatRp(dynamic amount) {
    if (amount == null) return "Rp 0";
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(amount);
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return "-";
    try {
      final d = DateTime.parse(dateStr);
      return DateFormat('dd MMM yyyy', 'id_ID').format(d);
    } catch (e) {
      return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
        : RefreshIndicator(
            onRefresh: () async {
              await _fetchDashboardData();
              await _fetchUnreadNotifikasi();
            },
            color: AppColors.primary,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _buildTopCurveHeader(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        _buildSummaryGrid(),
                        const SizedBox(height: 32),
                        _buildQuickMenuGrid(),
                        const SizedBox(height: 32),
                        _buildBannerSection(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTopCurveHeader() {
    final nama = _dashboardData?['namaLengkap'] ?? widget.namaLengkap ?? 'Anggota';
    final nip = _dashboardData?['nip'] ?? '-';
    final memberSince = _dashboardData?['createdAt'] != null 
        ? "Anggota sejak ${_formatDate(_dashboardData!['createdAt'])}" 
        : "Anggota Koperasi";

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20, 
        left: 20, 
        right: 20, 
        bottom: 24
      ),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo & Title & Notification
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo.png', width: 40, height: 40, errorBuilder: (c, e, s) => const Icon(LucideIcons.shield, color: AppColors.secondary, size: 32)),
                  const SizedBox(width: 12),
                  Text(
                    'KOPERASI BAKAMLA RI',
                    style: GoogleFonts.outfit(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(LucideIcons.bell, color: AppColors.white),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => NotifikasiScreen(anggotaId: widget.anggotaId)));
                    },
                  ),
                  if (_unreadNotifikasi > 0)
                    Positioned(
                      right: 12, top: 12,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        constraints: const BoxConstraints(minWidth: 8, minHeight: 8),
                      ),
                    ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          // User Info
          Row(
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.secondary, width: 2),
                  color: AppColors.white,
                ),
                child: const Icon(LucideIcons.user, size: 30, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Pagi,',
                      style: TextStyle(color: AppColors.white.withOpacity(0.8), fontSize: 13),
                    ),
                    Text(
                      nama,
                      style: GoogleFonts.outfit(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'NIP. $nip',
                      style: TextStyle(color: AppColors.secondary, fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      memberSince,
                      style: TextStyle(color: AppColors.white.withOpacity(0.6), fontSize: 11),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _isBalanceHidden = !_isBalanceHidden),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _isBalanceHidden ? LucideIcons.eyeOff : LucideIcons.eye,
                    color: AppColors.secondary,
                    size: 20,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSummaryGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.4,
      children: [
        _buildSummaryCard(
          title: 'Total Simpanan',
          amount: _dashboardData?['totalSimpanan'],
          icon: LucideIcons.wallet,
          color: AppColors.success,
        ),
        _buildSummaryCard(
          title: 'Sisa Pinjaman',
          amount: _dashboardData?['sisaPinjaman'],
          icon: LucideIcons.creditCard,
          color: AppColors.error,
        ),
        _buildSummaryCard(
          title: 'Tagihan Bulan Ini',
          amount: _dashboardData?['tagihanBulanIni'],
          icon: LucideIcons.calendarClock,
          color: AppColors.warning,
          subtitle: _dashboardData?['jatuhTempoTagihan'] != null 
            ? 'Jatuh Tempo: ${_formatDate(_dashboardData?['jatuhTempoTagihan'])}'
            : 'Tidak ada tagihan',
        ),
        _buildSummaryCard(
          title: 'Estimasi SHU',
          amount: _dashboardData?['shuTahunIni'],
          icon: LucideIcons.coins,
          color: AppColors.secondary,
        ),
      ],
    );
  }

  Widget _buildSummaryCard({required String title, required dynamic amount, required IconData icon, required Color color, String? subtitle}) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFFAF9F6), // Very light gold/warm white
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.15), 
            blurRadius: 15, 
            offset: const Offset(0, 8)
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05), 
            blurRadius: 4, 
            offset: const Offset(0, 2)
          ),
        ],
        border: Border.all(color: AppColors.secondary.withOpacity(0.3), width: 1),
      ),
      child: Stack(
        children: [
          // Glossy Shine (White gradient across the top)
          Positioned(
            left: -20,
            top: -20,
            right: -20,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          // Subtle Gold curve at bottom right
          Positioned(
            right: -20,
            bottom: -20,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.secondary.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(color: AppColors.secondary.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: Icon(icon, size: 16, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(color: AppColors.textMuted, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.2),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  _isBalanceHidden ? 'Rp •••••••' : _formatRp(amount),
                  style: GoogleFonts.outfit(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppColors.textMuted.withOpacity(0.8), fontSize: 9, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickMenuGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Layanan Kami',
          style: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 20,
          crossAxisSpacing: 8,
          children: [
            _menuIcon(LucideIcons.piggyBank, 'Simpanan', AppColors.success, () => Navigator.push(context, MaterialPageRoute(builder: (_) => SimpananScreen(anggotaId: widget.anggotaId)))),
            _menuIcon(LucideIcons.banknote, 'Pinjaman', AppColors.error, () => Navigator.push(context, MaterialPageRoute(builder: (_) => PinjamanScreen(anggotaId: widget.anggotaId)))),
            _menuIcon(LucideIcons.calculator, 'Angsuran', AppColors.warning, () => Navigator.push(context, MaterialPageRoute(builder: (_) => AngsuranScreen(anggotaId: widget.anggotaId)))),
            _menuIcon(LucideIcons.award, 'Data SHU', AppColors.secondary, () {
               Navigator.push(context, MaterialPageRoute(builder: (_) => ShuScreen(anggotaId: widget.anggotaId)));
            }),
            _menuIcon(LucideIcons.history, 'Riwayat', AppColors.primaryLight, () {
               Navigator.push(context, MaterialPageRoute(builder: (_) => RiwayatTransaksiScreen(anggotaId: widget.anggotaId)));
            }),
            _menuIcon(LucideIcons.fileSignature, 'Pengajuan', Colors.blue, () {
               Navigator.push(context, MaterialPageRoute(builder: (_) => PengajuanPinjamanScreen(anggotaId: widget.anggotaId)));
            }),
            _menuIcon(LucideIcons.headset, 'Pengaduan', Colors.purple, () {
               Navigator.push(context, MaterialPageRoute(builder: (_) => PengaduanScreen(anggotaId: widget.anggotaId)));
            }),
          ],
        ),
      ],
    );
  }

  Widget _menuIcon(IconData icon, String label, Color color, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: color.withOpacity(0.2),
        highlightColor: color.withOpacity(0.1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(0.15), color.withOpacity(0.05)],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withOpacity(0.2), width: 1),
                boxShadow: [
                  BoxShadow(color: color.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textMain),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerSection() {
    if (widget.isDefaultPassword) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: AppColors.error.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5)),
          ],
        ),
        child: Row(
          children: [
            const Icon(LucideIcons.shieldAlert, color: AppColors.white, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Peringatan Keamanan!',
                    style: GoogleFonts.outfit(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Anda masih menggunakan password default. Segera ubah password Anda di menu Profil demi keamanan.',
                    style: TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppColors.secondary.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.badgePercent, color: AppColors.white, size: 40),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bunga Pinjaman Spesial!',
                  style: GoogleFonts.outfit(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Hanya 0.8% untuk pengajuan bulan ini.',
                  style: TextStyle(color: AppColors.white, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 4) { // Profil
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen(anggotaId: widget.anggotaId, namaLengkap: widget.namaLengkap ?? 'Anggota')));
            return;
          }
          if (index == 3) { // Notifikasi
            Navigator.push(context, MaterialPageRoute(builder: (_) => NotifikasiScreen(anggotaId: widget.anggotaId)));
            return;
          }
          if (index == 2) { // Riwayat
            Navigator.push(context, MaterialPageRoute(builder: (_) => RiwayatTransaksiScreen(anggotaId: widget.anggotaId)));
            return;
          }
          if (index == 1) { // Toko Koperasi
            Navigator.push(context, MaterialPageRoute(builder: (_) => TokoScreen(anggotaId: widget.anggotaId)));
            return;
          }
          setState(() => _selectedIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.secondary, // Gold active
        unselectedItemColor: AppColors.textMuted,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.store), label: 'Toko Koperasi'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.bell), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profil'),
        ],
      ),
    );
  }
}
