import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../theme/colors.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'menu_screens.dart';
import '../config.dart';

class DashboardScreen extends StatefulWidget {
  final int? anggotaId;
  final String? namaLengkap;
  
  const DashboardScreen({
    super.key,
    this.anggotaId,
    this.namaLengkap,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool _isBalanceHidden = false;
  String _estimasiSHU = "Memuat...";
  String _totalSimpanan = "Memuat...";
  String _sisaPinjaman = "Memuat...";
  
  String get _namaPanggilan {
    if (widget.namaLengkap == null) return 'Anggota Koperasi';
    return widget.namaLengkap!.split(' ').first;
  }
  
  String get _inisial {
    if (widget.namaLengkap == null) return 'AG';
    final parts = widget.namaLengkap!.split(' ');
    if (parts.length > 1) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return widget.namaLengkap!.substring(0, 2).toUpperCase();
  }

  @override
  void initState() {
    super.initState();
    _fetchDashboardData();
  }

  Future<void> _fetchDashboardData() async {
    final aId = widget.anggotaId ?? 1; // fallback ke 1 jika null untuk testing
    
    try {
      // 1. Fetch Estimasi SHU
      final resShu = await http.get(Uri.parse('${ApiConfig.baseUrl}/shu/estimasi/$aId'));
      if (resShu.statusCode == 200) {
        final data = jsonDecode(resShu.body);
        final nominal = data['estimasiTotalShu'] as num;
        if (mounted) setState(() => _estimasiSHU = "Rp ${nominal.toStringAsFixed(0).replaceAll(RegExp(r'\\B(?=(\\d{3})+(?!\\d))'), '.')}");
      } else {
        if (mounted) setState(() => _estimasiSHU = "Rp 0");
      }
      
      // 2. Fetch Mobile Dashboard Data (Simpanan & Pinjaman)
      final resDash = await http.get(Uri.parse('${ApiConfig.baseUrl}/dashboard/mobile/$aId'));
      if (resDash.statusCode == 200) {
        final data = jsonDecode(resDash.body);
        final simpanan = data['totalSimpanan'] as num;
        final pinjaman = data['sisaPinjaman'] as num;
        
        if (mounted) {
          setState(() {
            _totalSimpanan = "Rp ${simpanan.toStringAsFixed(0).replaceAll(RegExp(r'\\B(?=(\\d{3})+(?!\\d))'), '.')}";
            _sisaPinjaman = "Rp ${pinjaman.toStringAsFixed(0).replaceAll(RegExp(r'\\B(?=(\\d{3})+(?!\\d))'), '.')}";
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _totalSimpanan = "Rp 0";
            _sisaPinjaman = "Rp 0";
          });
        }
      }
      
    } catch (e) {
      if (mounted) {
        setState(() {
          _estimasiSHU = "Gagal memuat";
          _totalSimpanan = "Gagal memuat";
          _sisaPinjaman = "Gagal memuat";
        });
      }
    }
  }

  final List<String> promoImages = [
    'https://via.placeholder.com/600x250/0B1E36/FFFFFF?text=Promo+Sembako+Murah',
    'https://via.placeholder.com/600x250/D4AF37/FFFFFF?text=Diskon+Akhir+Tahun',
    'https://via.placeholder.com/600x250/1A365D/FFFFFF?text=Beli+Banyak+Makin+Hemat',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildHeroCard(),
                const SizedBox(height: 32),
                _buildQuickActions(),
                const SizedBox(height: 32),
                _buildSHUCard(),
                const SizedBox(height: 32),
                _buildPromoSection(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primaryLight,
              child: Text(
                _inisial,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Halo,',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                  ),
                ),
                Text(
                  _namaPanggilan,
                  style: GoogleFonts.outfit(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(LucideIcons.bell, color: AppColors.primary),
              onPressed: () {},
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 8,
                  minHeight: 8,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RiwayatSimpananScreen(anggotaId: widget.anggotaId ?? 1),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: AppColors.cardGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -50,
                    top: -50,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Simpanan Saya',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isBalanceHidden = !_isBalanceHidden;
                              });
                            },
                            child: Icon(
                              _isBalanceHidden ? LucideIcons.eyeOff : LucideIcons.eye,
                              color: Colors.white.withOpacity(0.8),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isBalanceHidden ? 'Rp •••••••' : _totalSimpanan,
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            const Shadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sisa Pinjaman',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _isBalanceHidden ? 'Rp •••••••' : _sisaPinjaman,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Bayar',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Menu Cepat',
          style: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _actionButton(
              icon: LucideIcons.wallet,
              label: 'Ajukan\nPinjaman',
              color: Colors.blue,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PinjamanScreen())),
            ),
            _actionButton(
              icon: LucideIcons.piggyBank,
              label: 'Setor\nSimpanan',
              color: Colors.green,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SimpananScreen())),
            ),
            _actionButton(
              icon: LucideIcons.creditCard,
              label: 'Bayar\nAngsuran',
              color: Colors.orange,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AngsuranScreen(anggotaId: widget.anggotaId ?? 1))),
            ),
            _actionButton(
              icon: LucideIcons.shoppingBag,
              label: 'Toko\nKoperasi',
              color: AppColors.secondary,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TokoScreen())),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionButton({required IconData icon, required String label, required Color color, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.black.withOpacity(0.02)),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textMain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSHUCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.black.withOpacity(0.03)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(LucideIcons.coins, color: AppColors.secondary),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Estimasi SHU 2026',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _estimasiSHU,
                    style: GoogleFonts.outfit(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(LucideIcons.chevronRight, color: AppColors.textMuted),
        ],
      ),
    );
  }

  Widget _buildPromoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promo & Informasi',
          style: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 16),
        CarouselSlider(
          options: CarouselOptions(
            height: 140,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enlargeCenterPage: true,
            enlargeFactor: 0.15,
          ),
          items: promoImages.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen(anggotaId: widget.anggotaId ?? 1, namaLengkap: widget.namaLengkap ?? 'Anggota Koperasi')));
            return;
          }
          if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(userId: widget.anggotaId?.toString() ?? '1')));
            return; // Don't change index, just open screen
          }
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const TokoScreen()));
            return;
          }
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textMuted,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(LucideIcons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(LucideIcons.store),
            ),
            label: 'Toko',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(LucideIcons.messageCircle),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(LucideIcons.user),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
