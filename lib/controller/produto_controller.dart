import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';
import 'package:hasura_with_firebase_auth_jwt/model/tipo_produto_categoria_dto.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/adicionar_produto_page.dart';
import 'package:hasura_with_firebase_auth_jwt/repository/produto_repository.dart';

class ProdutoController extends GetxController{
  final produtoRepository = Get.find<ProdutoRepository>();

  static ProdutoController get to => Get.find();

  final RxList<Produto> _list = RxList<Produto>();
  List<Produto> get list => _list?.value ?? new List<Produto>();
  int get totalString => list.length;
  Produto get ultimoProduto => list.last;

  Future<TipoProdutoCategoriaDto> getAllProdutosTipoECategoria() async => await  produtoRepository.getTipoProdutoCategoria();
  Future<void> adicionarProduto(Produto produto) async => await  produtoRepository.adicionarProduto(produto);

  Worker _ever;

  @override
  void onInit() {
    print("iniciando Produto controller");
    _list.bindStream(produtoRepository.getProdutos());
    _ever = ever(_list, (valor) {
      print(valor.first.nome);
      if(valor.first.nome == "frente"){
        Get.to(AdicionarProduto());
      }
      if(valor.first.nome == "voltar"){
        Get.back();
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _ever.dispose();
    super.onClose();
  }
}