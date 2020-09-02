import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/todo_controller.dart';
import 'package:hasura_with_firebase_auth_jwt/model/todo_model.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() =>
            Text('todos ${TodoController.to.checkeds}')),
        actions: [
          IconButton(
            icon: Icon(Icons.restore_from_trash),
            onPressed: () {
              TodoController.to.removeAllChecked();
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              TodoController.to.addItem();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.defaultDialog(
            title: "Adicionar",
            content: TextField(
              controller: TodoController.to.textController,
            ),
            actions: [
              FlatButton(
                child: Text("Confirmar"),
                onPressed: () {
                  TodoController.to.addItem2();
                  Get.back();
                },
              )
            ]
          );
        },
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: TodoController.to.lista.length,
          itemBuilder: (context, index) {
            Rx<TodoModel> model = TodoController.to.lista[index];
            return ListTile(
              leading: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  TodoController.to.removeItem(model);
                },
              ),
              title: Text(model.value.name),
              trailing: Obx(
                () => Checkbox(
                  onChanged: (value) {
                    TodoController.to.toggleCheck(model, value);
                    print(model.value.checked);
                  },
                  value: model.value.checked,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
