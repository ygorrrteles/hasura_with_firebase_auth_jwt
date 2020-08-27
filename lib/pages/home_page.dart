import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/bindings/PaginaTresBinding.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/bindings/todo_bindings.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/pagina_tres_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/produto_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/adicionar_produto_page.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/pagina_tres.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/todo_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Obx(
            () => Text("${ProdutoController.to.list.length}"),
      ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Get.to(PaginaTres(), binding: PaginaTresBinding()),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => Get.to(TodoPage(), binding: TodoBingins()),
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
          itemCount: ProdutoController.to.list.length,
          itemBuilder: (context, index) {
            Produto produto = ProdutoController.to.list[index];
            return ListTile(
              title: Text(produto.nome),
            );
          },
        ),
      ),
    );
  }
}
