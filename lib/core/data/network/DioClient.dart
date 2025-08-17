import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  DioClient(String baseUrl)
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 15),
        )) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
