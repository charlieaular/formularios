import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}