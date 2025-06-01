import 'package:dio/dio.dart';
import 'package:dukldriver/api/lib/openapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  late final Openapi _api;
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: String.fromEnvironment(
        'API_URL',
        defaultValue: 'http://192.168.31.98:3111',
      ),
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  ApiProvider() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    _api = Openapi(dio: _dio);
  }

  Openapi get api => _api;
}
