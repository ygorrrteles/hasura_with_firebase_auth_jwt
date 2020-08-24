import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/pagina_tres_controller.dart';

class PaginaTres extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Obx(
              () => Text("${ControllerTres.to.contador}"),
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Text("${ControllerTres.to.contador}"),
          ),
          FlatButton(
            onPressed: (){
              ControllerTres.to.increment();
              ControllerTres.to.adicionarLista();
            },
            child: Text("aumentar"),
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: ControllerTres.to.lista.length,
                itemBuilder: (context, index) {
                  int posicao = ControllerTres.to.lista[index];
                  return Text("$posicao");
                },
              ),
            ),
          ),
          FlatButton(
            onPressed: (){
              if (Get.isDarkMode) {
                Get.changeTheme(ThemeData.light());
              } else {
                Get.changeTheme(ThemeData.dark());
              }
            },
            child: Text("trocar tema"),
          ),
        ],
      ),
    );
  }
}
