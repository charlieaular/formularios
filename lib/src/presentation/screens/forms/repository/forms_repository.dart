
import 'package:formularios/src/presentation/screens/forms/http/forms_http.dart';

class FormsRepository {
  FormsHttp formsHttp = FormsHttp();

  Future<bool> saveApi(Map<String, dynamic> obj) async {
    return formsHttp.saveApi(obj);
  }
}