import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../theme/colors.dart';
import '../../config.dart';

class PengaturanAkunScreen extends StatefulWidget {
  final int anggotaId;
  const PengaturanAkunScreen({super.key, required this.anggotaId});

  @override
  State<PengaturanAkunScreen> createState() => _PengaturanAkunScreenState();
}

class _PengaturanAkunScreenState extends State<PengaturanAkunScreen> {
  final _namaController = TextEditingController();
  final _nipController = TextEditingController();
  final _unitKerjaController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();

  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final res = await http.get(Uri.parse('${ApiConfig.baseUrl}/anggota/${widget.anggotaId}'));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        setState(() {
          _namaController.text = data['namaLengkap'] ?? '';
          _nipController.text = data['nip'] ?? '';
          _unitKerjaController.text = data['unitKerja'] ?? '';
          _noHpController.text = data['noHp'] ?? '';
          _alamatController.text = data['alamatRumah'] ?? '';
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveData() async {
    setState(() => _isSaving = true);
    try {
      final res = await http.put(
        Uri.parse('${ApiConfig.baseUrl}/anggota/${widget.anggotaId}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'namaLengkap': _namaController.text,
          'nip': _nipController.text,
          'unitKerja': _unitKerjaController.text,
          'noHp': _noHpController.text,
          'alamatRumah': _alamatController.text,
        }),
      );
      setState(() => _isSaving = false);
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profil berhasil diperbarui')));
        Navigator.pop(context, _namaController.text); // Return new name
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Gagal memperbarui profil')));
      }
    } catch (e) {
      setState(() => _isSaving = false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Terjadi kesalahan jaringan')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Pengaturan Akun', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField('Nama Lengkap', _namaController),
                  _buildTextField('NIP', _nipController),
                  _buildTextField('Unit Kerja', _unitKerjaController),
                  _buildTextField('No Handphone', _noHpController),
                  _buildTextField('Alamat Rumah', _alamatController, maxLines: 3),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isSaving ? null : _saveData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: _isSaving
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Simpan Perubahan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textMain)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
