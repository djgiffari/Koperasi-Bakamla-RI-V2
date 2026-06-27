import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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
      appBar: AppBar(
        title: Text('Profil Saya', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primaryLight,
              child: Icon(LucideIcons.user, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(_currentName, style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('ID Anggota: ${widget.anggotaId}', style: const TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 32),
            _buildMenu(LucideIcons.settings, 'Pengaturan Akun', onTap: () async {
              final newName = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PengaturanAkunScreen(anggotaId: widget.anggotaId)),
              );
              if (newName != null && newName is String) {
                setState(() => _currentName = newName);
              }
            }),
            _buildMenu(LucideIcons.shield, 'Keamanan & PIN', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => KeamananScreen(anggotaId: widget.anggotaId)),
              );
            }),
            _buildMenu(LucideIcons.helpCircle, 'Pusat Bantuan', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PusatBantuanScreen()),
              );
            }),
            _buildMenu(LucideIcons.logOut, 'Keluar', color: Colors.red, onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(IconData icon, String title, {Color color = AppColors.textMain, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5, offset: const Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.w500, color: color))),
            Icon(LucideIcons.chevronRight, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }
}
