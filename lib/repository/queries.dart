class ProdutoQueries{
  static final String GET_PRODUTOS = ''' 
subscription getProdutos{
  produto (order_by: {created_at: desc}) {
    id
    nome
    valor
    tipo_produto {
      id
      nome
      descricao
    }
    categoria_produto {
      id
      desrcicao
    }
  }
}''';

  static final String GET_TIPOCATEGORIAPRODUTO = ''' 
query getTipoCategoriaProduto {
  tipo_produto {
    id
    nome
    descricao
  }
  categoria_produto {
    id
    desrcicao
  }
}
''';

  static final String ADICIONAR_PRODUTO = ''' 
mutation adicionarProduto(\$valor: float8, \$tipo_produto_id: Int, \$nome: String, \$categoria_produto_id: Int) {
  insert_produto_one(object: {nome: \$nome, tipo_produto_id: \$tipo_produto_id, valor: \$valor, categoria_produto_id: \$categoria_produto_id}) {
    id
  }
}
''';
}

