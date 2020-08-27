import 'dart:convert';

import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';
import 'package:hasura_with_firebase_auth_jwt/model/tipo_produto_categoria_dto.dart';
import 'package:hasura_with_firebase_auth_jwt/repository/hasura_settings.dart';
import 'package:hasura_with_firebase_auth_jwt/repository/queries.dart';

class ProdutoRepository {
  final hasuraSettings = Get.find<HasuraSettings>();

  static ProdutoRepository get to => Get.find();

  Stream<List<Produto>> getProdutos(){
    var query = ProdutoQueries.GET_PRODUTOS;
    Snapshot snapshot = hasuraSettings.connect.subscription(query);
    return snapshot.map((item) => Produto.fromJsonList(item["data"]["produto"]));
  }

  Future<TipoProdutoCategoriaDto> getTipoProdutoCategoria() async {
    var query = ProdutoQueries.GET_TIPOCATEGORIAPRODUTO;
    var snapshot = await hasuraSettings.connect.query(query);
    return TipoProdutoCategoriaDto.fromMap(snapshot["data"]);
  }

  Future<void> adicionarProduto(Produto produto) async {
    var query = ProdutoQueries.ADICIONAR_PRODUTO;
    var snapshot = await hasuraSettings.connect.mutation(query, variables: {
      "valor": produto.valor,
      "nome": produto.nome,
      "tipo_produto_id": produto.tipoProduto.id,
      "categoria_produto_id": produto.categoriaProduto.id,
    });
    print(snapshot["data"]["insert_produto_one"]);
  }
}
