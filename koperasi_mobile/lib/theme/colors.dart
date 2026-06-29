import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0B1E36); // Navy Blue
  static const Color primaryLight = Color(0xFF1A365D);
  static const Color secondary = Color(0xFFD4AF37); // Gold
  static const Color secondaryLight = Color(0xFFF9F3DF); // Light Gold for backgrounds
  static const Color secondaryHover = Color(0xFFF1C40F);
  
  static const Color bgColor = Color(0xFFFFFFFF); // Pure White as requested
  static const Color surfaceColor = Color(0xFFF8FAFC); // Sleek off-white for cards
  static const Color textMain = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);
  static const Color white = Color(0xFFFFFFFF);
  
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  
  // Custom Gradients
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF0B1E36), Color(0xFF1A365D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0B1E36), Color(0xFF1A365D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFF1C40F), Color(0xFFD4AF37)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
