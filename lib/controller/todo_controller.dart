import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/model/todo_model.dart';

class TodoController extends GetxController {
  static TodoController get to => Get.find();

  TextEditingController textController = TextEditingController();

  final _todoList = <Rx<TodoModel>>[].obs;
  List<Rx<TodoModel>> get lista => _todoList.value;
  int get checkeds => _todoList.value.where((element) => element.value.checked == true).length;

  void addItem() {
    final item = TodoModel('blah', false);
    _todoList.add(Rx<TodoModel>(item));
  }

  void addItem2() {
    final item = TodoModel(textController.text, false);
    _todoList.add(Rx<TodoModel>(item));
    textController.clear();
  }

  void removeItem(Rx<TodoModel> model){
    _todoList.remove(model);
  }

  void removeAllChecked(){
    _todoList.removeWhere((element) => element.value.checked == true);
  }

  bool toggleCheck(Rx<TodoModel> model, bool value) {
    model.update((v) => v.checked = value);
  }
}
