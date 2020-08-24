import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/pagina_tres_controller.dart';

class PaginaTresBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerTres>(() => ControllerTres());
  }
}