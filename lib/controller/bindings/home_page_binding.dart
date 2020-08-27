import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/produto_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/repository/hasura_settings.dart';
import 'package:hasura_with_firebase_auth_jwt/repository/produto_repository.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProdutoController>(() => ProdutoController());
    Get.lazyPut<ProdutoRepository>(() => ProdutoRepository());
    Get.lazyPut<HasuraSettings>(() => HasuraSettings());
  }
}