import 'package:dio/dio.dart';
import '../constants/app_constants.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl + AppConstants.apiVersion,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Dio get dio => _dio;

  static Future<Response> sendOtp(String phoneNumber) async {
    try {
      final response = await _dio.post(
        AppConstants.sendOtpEndpoint,
        data: {'phone': phoneNumber},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

 
}
