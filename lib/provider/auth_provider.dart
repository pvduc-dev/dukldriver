import 'package:dio/dio.dart';
import 'package:dukldriver/api/lib/openapi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  AuthProvider() {
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getString('auth_token') != null;
    notifyListeners();
  }

  login(String phone, String otpCode) async {
    final response =
        await Openapi(
          dio: Dio(
            BaseOptions(
              baseUrl: String.fromEnvironment(
                'API_URL',
                defaultValue: 'http://192.168.31.98:3111',
              ),
              headers: {'Content-Type': 'application/json'},
            ),
          ),
        ).getAuthApi().authControllerLogin(
          loginRequestDto: LoginRequestDto(phone: phone, otpCode: otpCode),
        );
    if (response.data != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', response.data!.token);
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    _isLoggedIn = false;
    notifyListeners();
  }
}
