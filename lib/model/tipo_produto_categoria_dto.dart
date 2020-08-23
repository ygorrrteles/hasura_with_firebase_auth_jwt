// To parse this JSON data, do
//
//     final tipoProdutoCategoriaDao = tipoProdutoCategoriaDaoFromMap(jsonString);

import 'dart:convert';

class TipoProdutoCategoriaDto {
  TipoProdutoCategoriaDto({
    this.tipoProduto,
    this.categoriaProduto,
  });

  final List<TipoProduto> tipoProduto;
  final List<CategoriaProduto> categoriaProduto;

  TipoProdutoCategoriaDto copyWith({
    List<TipoProduto> tipoProduto,
    List<CategoriaProduto> categoriaProduto,
  }) =>
      TipoProdutoCategoriaDto(
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
      );

  factory TipoProdutoCategoriaDto.fromJson(String str) => TipoProdutoCategoriaDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoProdutoCategoriaDto.fromMap(Map<String, dynamic> json) => TipoProdutoCategoriaDto(
    tipoProduto: List<TipoProduto>.from(json["tipo_produto"].map((x) => TipoProduto.fromMap(x))),
    categoriaProduto: List<CategoriaProduto>.from(json["categoria_produto"].map((x) => CategoriaProduto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
    "categoria_produto": List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
  };
}

class CategoriaProduto {
  CategoriaProduto({
    this.id,
    this.desrcicao,
  });

  final int id;
  final String desrcicao;

  CategoriaProduto copyWith({
    int id,
    String desrcicao,
  }) =>
      CategoriaProduto(
        id: id ?? this.id,
        desrcicao: desrcicao ?? this.desrcicao,
      );

  factory CategoriaProduto.fromJson(String str) => CategoriaProduto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriaProduto.fromMap(Map<String, dynamic> json) => CategoriaProduto(
    id: json["id"],
    desrcicao: json["desrcicao"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "desrcicao": desrcicao,
  };
}

class TipoProduto {
  TipoProduto({
    this.id,
    this.nome,
    this.descricao,
  });

  final int id;
  final String nome;
  final String descricao;

  TipoProduto copyWith({
    int id,
    String nome,
    String descricao,
  }) =>
      TipoProduto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
      );

  factory TipoProduto.fromJson(String str) => TipoProduto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoProduto.fromMap(Map<String, dynamic> json) => TipoProduto(
    id: json["id"],
    nome: json["nome"],
    descricao: json["descricao"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nome": nome,
    "descricao": descricao,
  };
}
