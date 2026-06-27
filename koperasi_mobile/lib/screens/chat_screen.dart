import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../theme/colors.dart';
import '../config.dart';

class ChatScreen extends StatefulWidget {
  final String userId; // Anggota ID
  
  const ChatScreen({super.key, required this.userId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  List<dynamic> _messages = [];
  bool _isLoading = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchMessages();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _fetchMessages(isPolling: true);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _fetchMessages({bool isPolling = false}) async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/chat/${widget.userId}'));
      if (response.statusCode == 200) {
        setState(() {
          _messages = jsonDecode(response.body);
          if (!isPolling) _isLoading = false;
        });
      } else {
        if (!isPolling) setState(() => _isLoading = false);
      }
    } catch (e) {
      print('Error fetching chat: $e');
      if (!isPolling) setState(() => _isLoading = false);
    }
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    // Optimistic UI update
    final tempMsg = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'pengirimId': widget.userId,
      'penerimaId': 'admin',
      'pesan': text,
      'createdAt': DateTime.now().toIso8601String(),
    };
    
    setState(() {
      _messages.add(tempMsg);
      _messageController.clear();
    });

    try {
      final res = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/chat'), // Assumption endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'pengirimId': widget.userId,
          'penerimaId': 'admin',
          'pesan': text
        }),
      );
      if (res.statusCode != 201) {
        print('Gagal kirim pesan backend');
      }
    } catch (e) {
      print('Koneksi gagal saat kirim pesan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Icon(LucideIcons.headset, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CS Koperasi', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16)),
                const Text('Online', style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      final isMe = msg['pengirimId'] == widget.userId;
                      
                      return Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: isMe ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                              bottomLeft: isMe ? const Radius.circular(16) : const Radius.circular(0),
                              bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(16),
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Text(
                            msg['pesan'] ?? '',
                            style: TextStyle(color: isMe ? Colors.white : AppColors.textMain),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      filled: true,
                      fillColor: AppColors.bgColor,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(LucideIcons.send, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
