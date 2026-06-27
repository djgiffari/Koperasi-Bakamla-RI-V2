import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF0B1E36); // Navy Blue
  static const Color primaryLight = Color(0xFF1A365D);
  static const Color secondary = Color(0xFFD4AF37); // Gold
  static const Color secondaryHover = Color(0xFFF1C40F);
  
  static const Color bgColor = Color(0xFFF8FAFC); // Off-White / Sleek light
  static const Color textMain = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);
  static const Color white = Color(0xFFFFFFFF);
  
  // Custom Gradients
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF0B1E36), Color(0xFF1A365D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFF1C40F), Color(0xFFD4AF37)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
