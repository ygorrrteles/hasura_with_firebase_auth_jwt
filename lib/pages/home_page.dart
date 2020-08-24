import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/bindings/PaginaTresBinding.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/pagina_tres_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/produto_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/adicionar_produto_page.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/pagina_tres.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProdutoController controller = Get.put<ProdutoController>(ProdutoController());
    return Scaffold(
      appBar: AppBar(
      title: Obx(
            () => Text("${controller.list.length}"),
      ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Get.to(PaginaTres(), binding: PaginaTresBinding()),
          )
        ],
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.to(AdicionarProduto()),
      ),
      body: Obx(
        () => ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: controller.list.length,
          itemBuilder: (context, index) {
            Produto produto = controller.list[index];
            return ListTile(
              title: Text(produto.nome),
            );
          },
        ),
      ),
    );
  }
}
