import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/bindings/lista_paginada_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/paginaca_produto_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';

class ListaPaginada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Paginada"),
      ),
      body: Obx(
        () => ListView.builder(
          controller: PaginacaoProdutoController.to.scrollController,
          itemCount: PaginacaoProdutoController.to.listPaginada.length + 1,
          itemBuilder: (context, index) {
            if (index == PaginacaoProdutoController.to.listPaginada.length) {
              return Center(
                  child: Obx(()=> Text(PaginacaoProdutoController.to.msgCarregando.value)));
            }

            Produto produto = PaginacaoProdutoController.to.listPaginada[index];
            return Container(
              height: 100,
              child: ListTile(
                onTap: () {},
                title: Text("${produto.id}"),
                subtitle: Text("${produto.nome}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
