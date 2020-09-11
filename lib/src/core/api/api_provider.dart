import 'package:dio/dio.dart';
import 'package:formularios/src/core/api/api_interceptors.dart';

class ApiProvider {
  String baseUrl = 'aqui';
  Dio dio;

  ApiProvider(){
    dio = Dio(BaseOptions(
      baseUrl: baseUrl
    ));
    dio.interceptors.add(ApiInterceptors());
  }
}