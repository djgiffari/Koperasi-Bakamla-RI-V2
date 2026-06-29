import 'package:flutter/foundation.dart';
import 'dart:io';

class ApiConfig {
  // Set to false if you want to test on local server (localhost)
  static const bool isProduction = true;

  static String get baseUrl {
    if (isProduction) {
      // Pastikan URL ini sesuai dengan konfigurasi backend Anda (https://kpri.online/api atau https://api.kpri.online)
      return 'https://kpri.online/api';
    }

    // If running on web browser, use localhost
    if (kIsWeb) {
      return 'http://localhost:3000/api';
    }
    // If running on desktop (Windows, Mac, Linux), use localhost
    if (!kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux)) {
      return 'http://localhost:3000/api';
    }
    // If running on Android emulator, use 10.0.2.2
    return 'http://10.0.2.2:3000/api';
  }
}
