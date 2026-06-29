import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static String? _token;

  // Set token (used right after login or app startup)
  static Future<void> setToken(String token) async {
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
  }

  // Load token from storage
  static Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('jwt_token');
  }

  // Clear token (logout)
  static Future<void> clearToken() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
  }

  // Get headers
  static Map<String, String> get headers {
    final baseHeaders = {'Content-Type': 'application/json'};
    if (_token != null && _token!.isNotEmpty) {
      baseHeaders['Authorization'] = 'Bearer $_token';
    }
    return baseHeaders;
  }

  // HTTP GET Wrapper
  static Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    final mergedHeaders = {...ApiService.headers, ...?headers};
    return await http.get(url, headers: mergedHeaders);
  }

  // HTTP POST Wrapper
  static Future<http.Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final mergedHeaders = {...ApiService.headers, ...?headers};
    return await http.post(url, headers: mergedHeaders, body: body, encoding: encoding);
  }

  // HTTP PUT Wrapper
  static Future<http.Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final mergedHeaders = {...ApiService.headers, ...?headers};
    return await http.put(url, headers: mergedHeaders, body: body, encoding: encoding);
  }

  // HTTP DELETE Wrapper
  static Future<http.Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final mergedHeaders = {...ApiService.headers, ...?headers};
    return await http.delete(url, headers: mergedHeaders, body: body, encoding: encoding);
  }

  // Helper for Multipart Request headers
  static void addAuthHeaderToMultipart(http.MultipartRequest request) {
    if (_token != null && _token!.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $_token';
    }
  }
}
