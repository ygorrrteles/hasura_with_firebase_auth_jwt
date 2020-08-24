import 'dart:async';
import 'dart:ffi';

import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/produto_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/model/produto_model.dart';
import 'package:hasura_with_firebase_auth_jwt/model/tipo_produto_categoria_dto.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/widget/custom_combobox_widget.dart';

class AdicionarProduto extends StatelessWidget {

  ProdutoController produtoController = ProdutoController.to;
  TextEditingController descricao = TextEditingController();
  TextEditingController valor = TextEditingController();
  int categoriaId;
  int tipoId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
              () => Text("${ProdutoController.to.list.length}"),
        ),
      ),
      body: FutureBuilder(
        future: produtoController.getAllProdutosTipoECategoria(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final TipoProdutoCategoriaDto tipos = snapshot.data;
            return SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    controller: descricao,
                    decoration: InputDecoration(hintText: "Descrição", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: valor,
                    decoration: InputDecoration(hintText: "Valor", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomComboBoxWidget(
                    label: "Categoria do Produto",
                    lista: tipos.categoriaProduto.map((data) => Model(data.id, data.desrcicao)).toList(),
                    onchange: (Model item) => categoriaId = item.id,
                  ),
                  CustomComboBoxWidget(
                    label: "Tipo do Produto",
                    lista: tipos.tipoProduto.map((data) => Model(data.id, data.descricao)).toList(),
                    onchange: (Model item) => tipoId = item.id,
                  ),
                  RaisedButton(
                    child: Text("Salvar"),
                    onPressed: () async {
                      CategoriaProdutoModel categoria = CategoriaProdutoModel(id: categoriaId);
                      TipoProdutoModel tipoProduto = TipoProdutoModel(id: tipoId);
                      Produto produto = new Produto(
                        nome: descricao.text,
                        valor: double.parse(valor.text),
                        categoriaProduto: categoria,
                        tipoProduto: tipoProduto,
                      );
                      await produtoController.adicionarProduto(produto);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
