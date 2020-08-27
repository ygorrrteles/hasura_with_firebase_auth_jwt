import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/todo_controller.dart';

class TodoBingins extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}