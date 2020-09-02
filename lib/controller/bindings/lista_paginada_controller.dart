import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/paginaca_produto_controller.dart';

class ListaPaginadaController extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PaginacaoProdutoController>(() => PaginacaoProdutoController());
  }
}