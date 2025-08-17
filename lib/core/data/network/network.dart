import 'package:dio/dio.dart';

class Network {
  final Dio dio;
  Network(this.dio);

  Future<Response<T>> get<T>(String url) async {
    try {
      return await dio.get<T>(url);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
