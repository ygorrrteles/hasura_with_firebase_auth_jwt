import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';
import 'package:hasura_with_firebase_auth_jwt/model/tipo_produto_categoria_dto.dart';
import 'package:hasura_with_firebase_auth_jwt/repository/produto_repository.dart';

class ProdutoController extends GetxController{
  final ProdutoRepository produtoRepository = Get.put<ProdutoRepository>(ProdutoRepository());

  static ProdutoController get to => Get.find();

  final RxList<Produto> _list = RxList<Produto>();
  List<Produto> get list => _list?.value ?? new List<Produto>();
  int get totalString => list.length;
  Produto get ultimoProduto => list.last;

  Future<TipoProdutoCategoriaDto> getAllProdutosTipoECategoria() async => await  produtoRepository.getTipoProdutoCategoria();
  Future<void> adicionarProduto(Produto produto) async => await  produtoRepository.adicionarProduto(produto);

  @override
  void onInit() {
    _list.bindStream(produtoRepository.getProdutos());
    ever(_list, (valor) => print(valor.last.nome));
    super.onInit();
  }

}