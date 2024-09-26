import 'package:dio/dio.dart';

class DioConfig {
  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://viacep.com.br/ws',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
    return dio;
  }
}
