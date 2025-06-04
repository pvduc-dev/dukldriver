import 'package:dukldriver/api/lib/openapi.dart';
import 'package:dukldriver/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final BuildContext context;
  bool get isLoggedIn => _authToken != null;
  Driver? _me;
  Driver? get me => _me;

  String? _authToken;

  AuthProvider(this.context) {
    _getAuthToken();
    getMe();
  }

  _getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token');
    _authToken = authToken;
    if (authToken != null && context.mounted) {
      context.read<ApiProvider>().api.setBearerAuth('bearer', authToken);
    }
    notifyListeners();
  }

  getMe() async {
    final response = await context
        .read<ApiProvider>()
        .api
        .getAuthApi()
        .authControllerGetMe();
    if (response.data != null) {
      _me = response.data;
    }
  }

  login(String phone, String otpCode) async {
    final response = await context
        .read<ApiProvider>()
        .api
        .getAuthApi()
        .authControllerLogin(
          loginRequestDto: LoginRequestDto(phone: phone, otpCode: otpCode),
        );
    if (response.data != null) {
      String authToken = response.data!.token;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', authToken);
      _authToken = authToken;
      if (context.mounted) {
        context.read<ApiProvider>().api.setBearerAuth('bearer', authToken);
      }
      await getMe();
      notifyListeners();
    }
  }

  logout() async {
    await context.read<ApiProvider>().api.getAuthApi().authControllerLogout();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    _authToken = null;
    notifyListeners();
  }
}
