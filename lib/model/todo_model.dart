import 'package:get/get.dart';

class TodoModel {
  String name;
  bool checked;
  bool isEdit = false;

  TodoModel([this.name = "", this.checked = false]);
}
