import 'categoria.dart';

/// Representa uma solução CitizenTech apresentada no aplicativo.
class Solucao {
  const Solucao({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.localidade,
    required this.publicoBeneficiado,
    required this.ods,
    required this.categorias,
    required this.destaque,
    required this.imagemUrl,
  });

  final int id;
  final String nome;
  final String descricao;
  final String localidade;
  final String publicoBeneficiado;
  final String ods;
  final List<Categoria> categorias;
  final bool destaque;
  final String imagemUrl;

  /// Primeira categoria da lista (usada para escolher o ícone do registro).
  Categoria get categoriaPrincipal => categorias.first;

  /// Indica se a solução pertence à categoria informada.
  /// A categoria [Categoria.todas] aceita qualquer solução.
  bool pertenceA(Categoria categoria) {
    return categoria == Categoria.todas || categorias.contains(categoria);
  }
}
