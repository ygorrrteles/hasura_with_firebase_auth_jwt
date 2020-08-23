import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class CustomComboBoxWidget extends StatelessWidget {
  final List<Model> lista;
  final String label;
  final Function onchange;

  const CustomComboBoxWidget({this.lista, this.label, this.onchange});

  @override
  Widget build(BuildContext context) {
    return FindDropdown<Model>(
      items: lista,
      label: label,
      onChanged: onchange,
//      selectedItem: ,
      validate: (Model item) {
        if (item == null)
          return "Required field";
        else if (item == "Brasil")
          return "Invalid item";
        else
          return null; //return null to "no error"
      },
    );
  }
}

class Model{
  final int id;
  final String descricao;

  Model(this.id, this.descricao);

  @override
  String toString() => descricao.toString();
}
