import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:http/http.dart' as http;
import '../utils/api_service.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import '../config.dart';
import 'setor_simpanan_screen.dart';

class SimpananScreen extends StatefulWidget {
  final int anggotaId;
  const SimpananScreen({super.key, required this.anggotaId});

  @override
  State<SimpananScreen> createState() => _SimpananScreenState();
}

class _SimpananScreenState extends State<SimpananScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  bool _isLoading = true;
  List<dynamic> _saldoList = [];
  List<dynamic> _riwayatList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {}); // refresh view to filter history based on tab
      }
    });
    _fetchData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    setState(() => _isLoading = true);
    try {
      // Fetch Saldo
      final resSaldo = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/simpanan/saldo/${widget.anggotaId}'));
      if (resSaldo.statusCode == 200) {
        _saldoList = jsonDecode(resSaldo.body);
      }
      
      // Fetch Riwayat Mutasi
      final resRiwayat = await ApiService.get(Uri.parse('${ApiConfig.baseUrl}/simpanan/riwayat/${widget.anggotaId}'));
      if (resRiwayat.statusCode == 200) {
        _riwayatList = jsonDecode(resRiwayat.body);
      }
    } catch (e) {
      debugPrint('Error fetching simpanan: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _formatRp(dynamic amount) {
    if (amount == null) return "Rp 0";
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(amount);
  }

  double _getSaldo(String jenis) {
    final s = _saldoList.firstWhere((e) => e['jenisSimpanan'] == jenis, orElse: () => {'saldo': 0.0});
    return (s['saldo'] as num).toDouble();
  }

  List<dynamic> _getRiwayatFiltered(String jenis) {
    return _riwayatList.where((e) => e['jenisSimpanan'] == jenis).toList();
  }

  String get _currentTabJenis {
    switch (_tabController.index) {
      case 0: return 'POKOK';
      case 1: return 'WAJIB';
      case 2: return 'SUKARELA';
      default: return 'POKOK';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Simpanan Saya', style: GoogleFonts.outfit(color: AppColors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.secondary,
          indicatorWeight: 3,
          labelColor: AppColors.secondary,
          unselectedLabelColor: AppColors.white.withOpacity(0.6),
          labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 14),
          tabs: const [
            Tab(text: 'POKOK'),
            Tab(text: 'WAJIB'),
            Tab(text: 'SUKARELA'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : TabBarView(
              controller: _tabController,
              children: [
                _buildTabView('POKOK'),
                _buildTabView('WAJIB'),
                _buildTabView('SUKARELA'),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => SetorSimpananScreen(anggotaId: widget.anggotaId))).then((_) => _fetchData());
        },
        backgroundColor: AppColors.secondary,
        icon: const Icon(LucideIcons.piggyBank, color: AppColors.primary),
        label: const Text('Setor Simpanan', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildTabView(String jenis) {
    final saldo = _getSaldo(jenis);
    final riwayat = _getRiwayatFiltered(jenis);

    return RefreshIndicator(
      onRefresh: _fetchData,
      color: AppColors.primary,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBalanceCard(jenis, saldo),
                  const SizedBox(height: 32),
                  Text(
                    'Riwayat Transaksi',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          riwayat.isEmpty
              ? SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Icon(LucideIcons.wallet, size: 64, color: AppColors.textMuted.withOpacity(0.3)),
                          const SizedBox(height: 16),
                          const Text('Belum ada transaksi', style: TextStyle(color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = riwayat[index];
                      return _buildTransactionItem(item);
                    },
                    childCount: riwayat.length,
                  ),
                ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)), // FAB padding
        ],
      ),
    );
  }

  Widget _buildBalanceCard(String jenis, double saldo) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Simpanan $jenis',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _formatRp(saldo),
            style: GoogleFonts.outfit(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(LucideIcons.shieldCheck, color: AppColors.secondary, size: 16),
              const SizedBox(width: 8),
              Text(
                'Dana Anda dijamin aman oleh Koperasi',
                style: TextStyle(color: AppColors.white.withOpacity(0.8), fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTransactionItem(dynamic item) {
    final isSetoran = item['jenisMutasi'] == 'SETORAN';
    final nominal = item['nominal'] as num;
    final date = DateTime.parse(item['createdAt']);
    final status = item['status']; // MENUNGGU_VERIFIKASI, DISETUJUI, DITOLAK

    Color statusColor = AppColors.warning;
    if (status == 'DISETUJUI') statusColor = AppColors.success;
    if (status == 'DITOLAK') statusColor = AppColors.error;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceColor, width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSetoran ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isSetoran ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
              color: isSetoran ? AppColors.success : AppColors.error,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isSetoran ? 'Setoran' : 'Penarikan',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textMain),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('dd MMM yyyy, HH:mm').format(date),
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 6, height: 6,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: statusColor),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      status.replaceAll('_', ' '),
                      style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Text(
            '${isSetoran ? '+' : '-'} ${_formatRp(nominal)}',
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: isSetoran ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
