import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class PinjamanScreen extends StatelessWidget {
  const PinjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Pinjaman'),
      ),
      body: const Center(
        child: Text('Halaman Pengajuan Pinjaman (Segera Hadir)'),
      ),
    );
  }
}

class SimpananScreen extends StatelessWidget {
  const SimpananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setor Simpanan'),
      ),
      body: const Center(
        child: Text('Halaman Setor Simpanan (Segera Hadir)'),
      ),
    );
  }
}

class AngsuranScreen extends StatelessWidget {
  const AngsuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bayar Angsuran'),
      ),
      body: const Center(
        child: Text('Halaman Bayar Angsuran (Segera Hadir)'),
      ),
    );
  }
}

class TokoScreen extends StatelessWidget {
  const TokoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Koperasi'),
      ),
      body: const Center(
        child: Text('Halaman Toko Koperasi (Segera Hadir)'),
      ),
    );
  }
}
