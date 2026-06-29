import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import '../theme/colors.dart';
import '../config.dart';
import '../utils/currency_formatter.dart';

class PengajuanPinjamanScreen extends StatefulWidget {
  final int anggotaId;
  const PengajuanPinjamanScreen({super.key, required this.anggotaId});

  @override
  State<PengajuanPinjamanScreen> createState() => _PengajuanPinjamanScreenState();
}

class _PengajuanPinjamanScreenState extends State<PengajuanPinjamanScreen> {
  int _currentStep = 0;
  final _nominalController = TextEditingController();
  final _tenorController = TextEditingController();
  final String _skemaBunga = 'FLAT';
  
  PlatformFile? _ktpFile;
  PlatformFile? _slipGajiFile;
  bool _isLoading = false;

  Future<void> _pickFile(bool isKtp) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      setState(() {
        if (isKtp) {
          _ktpFile = result.files.first;
        } else {
          _slipGajiFile = result.files.first;
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

    setState(() => _isLoading = true);

    try {
      var request = http.MultipartRequest('POST', Uri.parse('${ApiConfig.baseUrl}/pinjaman'));
      ApiService.addAuthHeaderToMultipart(request);
      request.fields['anggotaId'] = widget.anggotaId.toString();
      request.fields['nominal'] = _nominalController.text.replaceAll(RegExp(r'[^0-9]'), '');
      request.fields['tenor'] = _tenorController.text;
      request.fields['skemaBunga'] = _skemaBunga;

      if (_ktpFile != null && _ktpFile!.path != null) {
        request.files.add(await http.MultipartFile.fromPath('ktpFile', _ktpFile!.path!));
      }
      if (_slipGajiFile != null && _slipGajiFile!.path != null) {
        request.files.add(await http.MultipartFile.fromPath('slipGajiFile', _slipGajiFile!.path!));
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
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showDialog(String title, String message, {bool isSuccess = false}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(isSuccess ? LucideIcons.checkCircle : LucideIcons.alertCircle, color: isSuccess ? AppColors.success : AppColors.error),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(color: isSuccess ? AppColors.success : AppColors.error, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(message, style: const TextStyle(fontSize: 14)),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              Navigator.pop(ctx);
              if (isSuccess) Navigator.pop(context); // Go back to dashboard
            },
            child: const Text('OK', style: TextStyle(color: AppColors.white)),
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
        title: Text('Pengajuan Pinjaman', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.white)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep == 0) {
            if (_nominalController.text.isEmpty || _tenorController.text.isEmpty) {
              _showDialog('Peringatan', 'Mohon isi Nominal dan Tenor terlebih dahulu');
              return;
            }
          } else if (_currentStep == 1) {
            if (_ktpFile == null) {
              _showDialog('Peringatan', 'Mohon lampirkan Foto/Dokumen KTP');
              return;
            }
          } else if (_currentStep == 2) {
            if (_slipGajiFile == null) {
              _showDialog('Peringatan', 'Mohon lampirkan Slip Gaji');
              return;
            }
            _submitPinjaman();
            return;
          }
          setState(() {
            if (_currentStep < 2) _currentStep += 1;
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) _currentStep -= 1;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _isLoading ? null : details.onStepContinue,
                    child: _isLoading && _currentStep == 2
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.primary, strokeWidth: 3))
                        : Text(
                            _currentStep == 2 ? 'Ajukan Sekarang' : 'Lanjut',
                            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                  ),
                ),
                if (_currentStep > 0) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        side: const BorderSide(color: AppColors.primary),
                      ),
                      onPressed: _isLoading ? null : details.onStepCancel,
                      child: const Text('Kembali', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ),
                ]
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Data Pinjaman', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Tentukan nominal dan durasi'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary.withOpacity(0.1)),
                  ),
                  child: const Row(
                    children: [
                      Icon(LucideIcons.info, color: AppColors.primary, size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Plafon maksimal adalah 3x Total Simpanan Anda.',
                          style: TextStyle(color: AppColors.primary, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Nominal Pinjaman (Rp)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 8),
                TextField(
                  controller: _nominalController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [CurrencyInputFormatter()],
                  decoration: InputDecoration(
                    hintText: 'Contoh: 5000000',
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Tenor (Bulan)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 8),
                TextField(
                  controller: _tenorController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Contoh: 12',
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Dokumen KTP', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Upload Foto atau PDF KTP'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            content: _buildFilePickerBox(
              title: 'Upload KTP',
              file: _ktpFile,
              onTap: () => _pickFile(true),
            ),
          ),
          Step(
            title: const Text('Slip Gaji', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Upload Slip Gaji Bulan Terakhir'),
            isActive: _currentStep >= 2,
            content: _buildFilePickerBox(
              title: 'Upload Slip Gaji',
              file: _slipGajiFile,
              onTap: () => _pickFile(false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilePickerBox({required String title, PlatformFile? file, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: file != null ? AppColors.success : AppColors.surfaceColor,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              file != null ? LucideIcons.checkCircle2 : LucideIcons.uploadCloud,
              color: file != null ? AppColors.success : AppColors.primary,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              file != null ? 'Dokumen dilampirkan:\n${file.name}' : title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: file != null ? AppColors.success : AppColors.textMain,
                fontWeight: file != null ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
            ),
            if (file == null) ...[
              const SizedBox(height: 4),
              const Text('Format: JPG, PNG, PDF', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
            ]
          ],
        ),
      ),
    );
  }
}
