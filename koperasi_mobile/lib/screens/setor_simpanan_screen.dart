import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import '../theme/colors.dart';
import '../config.dart';
import '../utils/currency_formatter.dart';

class SetorSimpananScreen extends StatefulWidget {
  final int anggotaId;
  const SetorSimpananScreen({super.key, required this.anggotaId});

  @override
  State<SetorSimpananScreen> createState() => _SetorSimpananScreenState();
}

class _SetorSimpananScreenState extends State<SetorSimpananScreen> {
  final _nominalController = TextEditingController();
  String _jenisSimpanan = 'WAJIB';
  
  XFile? _buktiFile;
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFile() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _buktiFile = image;
      });
    }
  }

  Future<void> _submitSimpanan() async {
    if (_nominalController.text.isEmpty) {
      _showDialog('Error', 'Harap isi nominal simpanan');
      return;
    }
    if (_buktiFile == null) {
      _showDialog('Error', 'Harap lampirkan Bukti Transfer');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      var request = http.MultipartRequest('POST', Uri.parse('${ApiConfig.baseUrl}/simpanan'));
      ApiService.addAuthHeaderToMultipart(request);
      request.fields['anggotaId'] = widget.anggotaId.toString();
      request.fields['nominal'] = _nominalController.text.replaceAll(RegExp(r'[^0-9]'), '');
      request.fields['jenisSimpanan'] = _jenisSimpanan;
      request.fields['keterangan'] = 'Setoran via Mobile App';

      if (_buktiFile != null) {
        request.files.add(await http.MultipartFile.fromPath('buktiFile', _buktiFile!.path));
      }

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        _showDialog('Sukses', 'Setoran berhasil dicatat, menunggu verifikasi Admin.', isSuccess: true);
      } else {
        _showDialog('Gagal', 'Terjadi kesalahan: $responseData');
      }
    } catch (e) {
      print('Error submit simpanan: $e');
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
        title: Text('Setor Simpanan', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jenis Simpanan', style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _jenisSimpanan,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: 'POKOK', child: Text('Simpanan Pokok')),
                    DropdownMenuItem(value: 'WAJIB', child: Text('Simpanan Wajib')),
                    DropdownMenuItem(value: 'SUKARELA', child: Text('Simpanan Sukarela')),
                  ],
                  onChanged: (val) {
                    if (val != null) setState(() => _jenisSimpanan = val);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            Text('Nominal Setoran (Rp)', style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              inputFormatters: [CurrencyInputFormatter()],
              decoration: InputDecoration(
                hintText: 'Contoh: 150000',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            
            Text('Bukti Transfer', style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _buktiFile != null ? Colors.green : Colors.grey.withOpacity(0.3), style: BorderStyle.solid),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LucideIcons.camera, color: _buktiFile != null ? Colors.green : AppColors.primary, size: 32),
                    const SizedBox(height: 8),
                    Text(
                      _buktiFile != null ? 'Bukti berhasil dilampirkan\n(${_buktiFile!.name})' : 'Ketuk untuk melampirkan Foto Bukti Transfer',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: _buktiFile != null ? Colors.green : AppColors.textMuted, fontSize: 13),
                    )
                  ],
                ),
              ),
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
                onPressed: _isLoading ? null : _submitSimpanan,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Kirim Setoran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
