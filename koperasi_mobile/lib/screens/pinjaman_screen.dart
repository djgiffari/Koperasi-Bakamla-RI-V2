import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../theme/colors.dart';
import '../config.dart';

class PinjamanScreen extends StatefulWidget {
  const PinjamanScreen({super.key});

  @override
  State<PinjamanScreen> createState() => _PinjamanScreenState();
}

class _PinjamanScreenState extends State<PinjamanScreen> {
  final _nominalController = TextEditingController();
  final _tenorController = TextEditingController();
  final String _skemaBunga = 'FLAT';
  
  XFile? _ktpFile;
  XFile? _slipGajiFile;
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFile(bool isKtp) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isKtp) {
          _ktpFile = image;
        } else {
          _slipGajiFile = image;
        }
      });
    }
  }

  Future<void> _submitPinjaman() async {
    if (_nominalController.text.isEmpty || _tenorController.text.isEmpty) {
      _showDialog('Error', 'Harap isi nominal dan tenor pinjaman');
      return;
    }
    if (_ktpFile == null || _slipGajiFile == null) {
      _showDialog('Error', 'Harap lampirkan KTP dan Slip Gaji');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      var request = http.MultipartRequest('POST', Uri.parse('${ApiConfig.baseUrl}/pinjaman'));
      request.fields['anggotaId'] = '1'; // Default dummy anggotaId
      request.fields['nominal'] = _nominalController.text.replaceAll(RegExp(r'[^0-9]'), '');
      request.fields['tenor'] = _tenorController.text;
      request.fields['skemaBunga'] = _skemaBunga;

      if (_ktpFile != null) {
        request.files.add(await http.MultipartFile.fromPath('ktpFile', _ktpFile!.path));
      }
      if (_slipGajiFile != null) {
        request.files.add(await http.MultipartFile.fromPath('slipGajiFile', _slipGajiFile!.path));
      }

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        _showDialog('Sukses', 'Pengajuan pinjaman berhasil! Menunggu persetujuan Admin.', isSuccess: true);
      } else {
        _showDialog('Gagal', 'Terjadi kesalahan: $responseData');
      }
    } catch (e) {
      print('Error submit pinjaman: $e');
      _showDialog('Error', 'Koneksi ke server bermasalah');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showDialog(String title, String message, {bool isSuccess = false}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: TextStyle(color: isSuccess ? Colors.green : Colors.red)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              if (isSuccess) Navigator.pop(context);
            },
            child: const Text('OK'),
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
        title: Text('Pengajuan Pinjaman', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
                  Icon(LucideIcons.info, color: Colors.blue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Plafon maksimal adalah 3x Total Simpanan Anda. Pastikan lampiran KTP dan Slip Gaji jelas terbaca.',
                      style: TextStyle(color: Colors.blue, fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            Text('Nominal Pinjaman (Rp)', style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Contoh: 5000000',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),

            Text('Tenor (Bulan)', style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _tenorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Contoh: 12',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            
            Text('Lampiran Wajib', style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            _buildFilePicker(
              title: 'Foto KTP',
              file: _ktpFile,
              onTap: () => _pickFile(true),
            ),
            const SizedBox(height: 12),
            _buildFilePicker(
              title: 'Slip Gaji Bulan Terakhir',
              file: _slipGajiFile,
              onTap: () => _pickFile(false),
            ),
            
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _isLoading ? null : _submitPinjaman,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Ajukan Sekarang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFilePicker({required String title, XFile? file, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: file != null ? Colors.green : Colors.grey.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(LucideIcons.uploadCloud, color: file != null ? Colors.green : AppColors.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                  if (file != null)
                    Text(file.name, style: const TextStyle(fontSize: 12, color: Colors.green), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            if (file != null) const Icon(LucideIcons.checkCircle2, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
