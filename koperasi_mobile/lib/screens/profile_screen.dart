import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import '../theme/colors.dart';
import '../config.dart';
import 'login_screen.dart';

import 'profile/pengaturan_akun_screen.dart';
import 'profile/keamanan_screen.dart';
import 'profile/pusat_bantuan_screen.dart';

class ProfileScreen extends StatefulWidget {
  final int anggotaId;
  final String namaLengkap;

  const ProfileScreen({super.key, required this.anggotaId, required this.namaLengkap});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _currentName;

  @override
  void initState() {
    super.initState();
    _currentName = widget.namaLengkap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            expandedHeight: 280,
            floating: false,
            pinned: true,
            iconTheme: const IconThemeData(color: AppColors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40), // Safe area offset
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.bgColor,
                        child: Icon(LucideIcons.user, size: 50, color: AppColors.primary),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _currentName,
                      style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'ID Anggota: ${widget.anggotaId}',
                        style: const TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PENGATURAN', style: GoogleFonts.outfit(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildMenuCard([
                    _buildMenuItem(LucideIcons.user, 'Pengaturan Akun', onTap: () async {
                      final newName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PengaturanAkunScreen(anggotaId: widget.anggotaId)),
                      );
                      if (newName != null && newName is String) {
                        setState(() => _currentName = newName);
                      }
                    }),
                    _buildMenuItem(LucideIcons.shield, 'Keamanan & PIN', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => KeamananScreen(anggotaId: widget.anggotaId)));
                    }),
                  ]),
                  
                  const SizedBox(height: 24),
                  Text('BANTUAN & INFO', style: GoogleFonts.outfit(color: AppColors.textMuted, fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildMenuCard([
                    _buildMenuItem(LucideIcons.helpCircle, 'Pusat Bantuan', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const PusatBantuanScreen()));
                    }),
                    _buildMenuItem(LucideIcons.info, 'Syarat & Ketentuan', onTap: () => _showPolicyDialog('Syarat & Ketentuan', 'SYARAT_KETENTUAN')),
                    _buildMenuItem(LucideIcons.fileText, 'Kebijakan Privasi', onTap: () => _showPolicyDialog('Kebijakan Privasi', 'KEBIJAKAN_PRIVASI')),
                  ]),
                  
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error,
                        side: const BorderSide(color: AppColors.error),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        _showLogoutDialog();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(LucideIcons.logOut, size: 18),
                          SizedBox(width: 8),
                          Text('Keluar Akun', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Center(
                    child: Text('Koperasi Bakamla Mobile v1.0.0', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keluar Akun', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: AppColors.textMuted)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text('Keluar', style: TextStyle(color: AppColors.white)),
          )
        ],
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceColor),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textMain))),
            const Icon(LucideIcons.chevronRight, color: AppColors.textMuted, size: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _showPolicyDialog(String title, String category) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
    );

    String content = "Teks belum tersedia.";
    try {
      final response = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/pengaturan'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final policy = data.firstWhere((e) => e['kategori'] == category, orElse: () => null);
        if (policy != null && policy['nilai'] != null && policy['nilai'].toString().isNotEmpty) {
          content = policy['nilai'];
        } else {
          // Default text if not found
          content = "Sesuai dengan peraturan yang berlaku pada Koperasi Bakamla RI, seluruh data anggota dijaga kerahasiaannya. "
                    "Segala bentuk penyalahgunaan data atau pelanggaran komitmen simpan pinjam akan ditindaklanjuti sesuai prosedur instansi Bakamla RI.";
        }
      }
    } catch (e) {
      debugPrint("Error fetching $category: $e");
    }

    if (mounted) {
      Navigator.pop(context); // Close loading
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (ctx) => Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
              ),
              const SizedBox(height: 24),
              Text(title, style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary)),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: const TextStyle(fontSize: 14, color: AppColors.textMain, height: 1.6),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(ctx),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Tutup', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
