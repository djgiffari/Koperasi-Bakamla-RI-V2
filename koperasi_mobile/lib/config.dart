import 'package:flutter/foundation.dart';

class ApiConfig {
  static String get baseUrl {
    // If running on web browser, use localhost
    if (kIsWeb) {
      return 'http://localhost:3000/api';
    }
    // If running on Android emulator, use 10.0.2.2
    return 'http://10.0.2.2:3000/api';
  }
}
