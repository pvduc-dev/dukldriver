import 'package:dio/dio.dart';
import 'package:dukldriver/api/lib/openapi.dart';
import 'package:dukldriver/utils/dialog_util.dart';
import 'package:flutter/material.dart';

class ApiProvider {
  late final Openapi _api;
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: String.fromEnvironment(
        'API_URL',
        defaultValue: 'http://192.168.31.98:7111',
      ),
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  ApiProvider() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
              final context = options.extra['context'];
              if (context is BuildContext) {
                if (options.extra['isLoading'] == true) {
                  DialogUtil.showLoadingDialog(context);
                }
              }
              handler.next(options);
            },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          final context = response.requestOptions.extra['context'];
          if (context is BuildContext) {
            if (response.requestOptions.extra['isLoading'] == true) {
              Navigator.pop(context);
            }
          }
          handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          final context = error.requestOptions.extra['context'];
          if (context is BuildContext) {
            if (error.requestOptions.extra['isLoading'] == true) {
              Navigator.pop(context);
            }

            String errorMessage = '';
            switch (error.type) {
              case DioExceptionType.connectionTimeout:
                errorMessage = 'Kết nối mạng không ổn định, vui lòng thử lại';
                break;
              case DioExceptionType.sendTimeout:
                errorMessage = 'Kết nối mạng không ổn định, vui lòng thử lại';
                break;
              case DioExceptionType.receiveTimeout:
                errorMessage = 'Kết nối mạng không ổn định, vui lòng thử lại';
                break;
              case DioExceptionType.connectionError:
                errorMessage = 'Không thể kết nối đến máy chủ';
                break;
              case DioExceptionType.badResponse:
                if (error.response?.statusCode == 401) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/phone',
                    (route) => false,
                  );
                }
                errorMessage =
                    error.response?.data['message'] ?? 'Lỗi không xác định';
                break;
              default:
                errorMessage = 'Đã xảy ra lỗi, vui lòng thử lại sau';
            }

            DialogUtil.showErrorDialog(context, errorMessage);
          }
          handler.next(error);
        },
      ),
    );

    _api = Openapi(dio: _dio);
  }

  Openapi get api => _api;
}
