import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/produto_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/adicionar_produto_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProdutoController controller = Get.put<ProdutoController>(ProdutoController());
    return Scaffold(
      appBar: AppBar(
      title: Obx(
            () => Text("${controller.list.length}"),
      ),
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
