import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ControllerTres extends GetxController{

  static ControllerTres get to => Get.find();

  final _contador = 0.obs;
  int get contador => _contador.value;
  void increment() {
    this._contador.value++;
    GetStorage box = GetStorage();
    box.write("contador", _contador.value);
  }

  final _lista = List<int>().obs;
  List<int> get lista => _lista.value.toList();

  void adicionarLista() => _lista.add(contador);

  @override
  void onInit() async {
    GetStorage box = GetStorage();
    bool iniciado;
    print(iniciado);
    iniciado = await box.initStorage;
    print(iniciado);
    if(box.read("contador") != null){
      _contador.value = box.read("contador");
    }
  }
}