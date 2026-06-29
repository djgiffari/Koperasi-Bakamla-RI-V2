import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import '../theme/colors.dart';
import '../config.dart';

class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({super.key});

  @override
  State<ForgotPinScreen> createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState extends State<ForgotPinScreen> {
  final _nipController = TextEditingController();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPinController = TextEditingController();
  
  bool _isLoading = false;
  bool _otpSent = false;
  bool _obscurePin = true;

  Future<void> _handleSendTicket() async {
    if (_nipController.text.isEmpty || _emailController.text.isEmpty) {
      _showSnackBar('NIP dan Email harus diisi');
      return;
    }
    
    setState(() => _isLoading = true);

    try {
      final response = await ApiService.post(
        Uri.parse('${ApiConfig.baseUrl}/auth/forgot-pin/ticket'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nip': _nipController.text,
          'email': _emailController.text,
        }),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _showSnackBar(data['message'] ?? 'Permintaan terkirim');
        if (mounted) Navigator.pop(context);
      } else {
        _showSnackBar(data['error'] ?? 'Gagal mengirim tiket');
      }
    } catch (e) {
      _showSnackBar('Koneksi bermasalah');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleSendOtp() async {
    if (_nipController.text.isEmpty || _emailController.text.isEmpty) {
      _showSnackBar('NIP dan Email harus diisi');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await ApiService.post(
        Uri.parse('${ApiConfig.baseUrl}/auth/forgot-pin/otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nip': _nipController.text,
          'email': _emailController.text,
        }),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _showSnackBar(data['message'] ?? 'OTP Terkirim (Simulasi: 1234)');
        setState(() => _otpSent = true);
      } else {
        _showSnackBar(data['error'] ?? 'Gagal mengirim OTP');
      }
    } catch (e) {
      _showSnackBar('Koneksi bermasalah');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleResetPin() async {
    if (_otpController.text.isEmpty || _newPinController.text.isEmpty) {
      _showSnackBar('OTP dan PIN Baru harus diisi');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await ApiService.post(
        Uri.parse('${ApiConfig.baseUrl}/auth/reset-pin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nip': _nipController.text,
          'otp': _otpController.text,
          'newPassword': _newPinController.text,
        }),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _showSnackBar(data['message'] ?? 'PIN berhasil direset');
        if (mounted) Navigator.pop(context);
      } else {
        _showSnackBar(data['error'] ?? 'Gagal reset PIN');
      }
    } catch (e) {
      _showSnackBar('Koneksi bermasalah');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [AppColors.primary, AppColors.bgColor],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.secondary.withOpacity(0.5), width: 2),
                      ),
                      child: const Icon(LucideIcons.key, size: 40, color: AppColors.secondary),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Lupa PIN?',
                      style: GoogleFonts.outfit(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _otpSent
                          ? 'Masukkan 4 digit OTP yang dikirim ke email Anda, dan buat PIN baru.'
                          : 'Masukkan NIP dan Email. Pilih metode pemulihan yang Anda inginkan.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8)),
                    ),
                    const SizedBox(height: 32),
                    
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                          ),
                          child: AnimatedCrossFade(
                            firstChild: _buildFormRequest(),
                            secondChild: _buildFormVerify(),
                            crossFadeState: _otpSent ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormRequest() {
    return Column(
      children: [
        _buildTextField(controller: _nipController, hintText: 'NIP / NRP', icon: LucideIcons.creditCard, keyboardType: TextInputType.number),
        const SizedBox(height: 16),
        _buildTextField(controller: _emailController, hintText: 'Alamat Email', icon: LucideIcons.mail, keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 32),
        
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleSendTicket,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Bantuan Admin', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleSendOtp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.secondary,
                  foregroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: _isLoading 
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.primary, strokeWidth: 2))
                    : const Text('Kirim OTP', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormVerify() {
    return Column(
      children: [
        _buildTextField(controller: _otpController, hintText: 'Kode OTP (Simulasi: 1234)', icon: LucideIcons.scanLine, keyboardType: TextInputType.number),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _newPinController,
          hintText: 'PIN Keamanan Baru',
          icon: LucideIcons.lock,
          isPassword: true,
          obscureText: _obscurePin,
          onToggleVisibility: () => setState(() => _obscurePin = !_obscurePin),
        ),
        const SizedBox(height: 32),
        
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handleResetPin,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: _isLoading 
                ? const CircularProgressIndicator(color: AppColors.primary)
                : const Text('Simpan PIN Baru', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() => _otpSent = false),
          child: const Text('Kembali ke form sebelumnya', style: TextStyle(color: Colors.white70)),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.8)),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(obscureText ? LucideIcons.eyeOff : LucideIcons.eye, color: Colors.white.withOpacity(0.8)),
                  onPressed: onToggleVisibility,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
