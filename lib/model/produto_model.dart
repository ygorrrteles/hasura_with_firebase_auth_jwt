import 'dart:convert';

class Produto {
  Produto({
    this.id,
    this.nome,
    this.valor,
    this.tipoProduto,
    this.categoriaProduto,
  });

  final int id;
  final String nome;
  final double valor;
  final TipoProdutoModel tipoProduto;
  final CategoriaProdutoModel categoriaProduto;

  Produto copyWith({
    int id,
    String nome,
    double valor,
    TipoProdutoModel tipoProduto,
    CategoriaProdutoModel categoriaProduto,
  }) =>
      Produto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        valor: valor ?? this.valor,
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
      );

  factory Produto.fromJson(String str) => Produto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
    id: json["id"],
    nome: json["nome"],
    valor: json["valor"].toDouble(),
    tipoProduto: TipoProdutoModel.fromMap(json["tipo_produto"]),
    categoriaProduto: CategoriaProdutoModel.fromMap(json["categoria_produto"]),
  );

  factory Produto.fromMapSimples(Map<String, dynamic> json) => Produto(
    id: json["id"],
    nome: json["nome"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nome": nome,
    "valor": valor,
    "tipo_produto": tipoProduto.toMap(),
    "categoria_produto": categoriaProduto.toMap(),
  };

  static List<Produto> fromJsonList(List list) {
    if(list == null) return null;
    return list.map<Produto>((item) => Produto.fromMap(item)).toList();
  }

  static List<Produto> fromJsonListSimples(List list) {
    if(list == null) return null;
    return list.map<Produto>((item) => Produto.fromMapSimples(item)).toList();
  }
}

class CategoriaProdutoModel {
  CategoriaProdutoModel({
    this.id,
    this.desrcicao,
  });

  final int id;
  final String desrcicao;

  CategoriaProdutoModel copyWith({
    int id,
    String desrcicao,
  }) =>
      CategoriaProdutoModel(
        id: id ?? this.id,
        desrcicao: desrcicao ?? this.desrcicao,
      );

  factory CategoriaProdutoModel.fromJson(String str) => CategoriaProdutoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriaProdutoModel.fromMap(Map<String, dynamic> json) => CategoriaProdutoModel(
    id: json["id"],
    desrcicao: json["desrcicao"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "desrcicao": desrcicao,
  };
}

class TipoProdutoModel {
  TipoProdutoModel({
    this.id,
    this.nome,
    this.descricao,
  });

  final int id;
  final String nome;
  final String descricao;

  TipoProdutoModel copyWith({
    int id,
    String nome,
    String descricao,
  }) =>
      TipoProdutoModel(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
      );

  factory TipoProdutoModel.fromJson(String str) => TipoProdutoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoProdutoModel.fromMap(Map<String, dynamic> json) => TipoProdutoModel(
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
