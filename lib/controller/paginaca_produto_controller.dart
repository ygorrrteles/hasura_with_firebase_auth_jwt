import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';
import 'package:hasura_with_firebase_auth_jwt/repository/produto_repository.dart';

class PaginacaoProdutoController extends GetxController{
  static PaginacaoProdutoController get to => Get.find();
  final _produtoRepository = Get.find<ProdutoRepository>();

  ScrollController scrollController = ScrollController();
  final msgCarregando = "carregando".obs;

  int _maxOffSet = 10;
  final _listPaginada = List<Produto>().obs;
  List<Produto> get listPaginada => _listPaginada;


  Future paginationOffSet() async {
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        msgCarregando.value = "carregando";
        _listPaginada.addAll(await _produtoRepository.getProdutosPaginados(_maxOffSet));
        _maxOffSet = _maxOffSet + 10;
        msgCarregando.value = "acabou";
      }
    });
  }

  @override
  void onInit() async {
    _listPaginada.value = await _produtoRepository.getProdutosPaginados(0);
    await paginationOffSet();
    super.onInit();
  }
}