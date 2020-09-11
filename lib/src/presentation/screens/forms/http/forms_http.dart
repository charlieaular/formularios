import 'package:formularios/src/core/api/api_provider.dart';

class FormsHttp extends ApiProvider {

  Future<bool> saveApi(Map<String, dynamic> obj) async {
    await Future.delayed(Duration(seconds: 10));
    print('enviado');
    return true;
  }
}