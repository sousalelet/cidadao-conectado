import '../models/categoria.dart';
import '../models/solucao.dart';

/// Centraliza os dados do aplicativo (mantidos em memória).
class SolucaoRepository {
  const SolucaoRepository();

  static const List<Solucao> _solucoes = [
    Solucao(
      id: 1,
      nome: 'Rota Acessível',
      descricao:
          'Aplicativo que traça rotas considerando calçadas, iluminação e '
          'acessibilidade para cadeirantes, idosos e pedestres.',
      localidade: 'São Paulo - SP',
      publicoBeneficiado: 'Pedestres e pessoas com deficiência',
      ods: 'ODS 11 - Cidades sustentáveis',
      categorias: [Categoria.mobilidade, Categoria.cidadania],
      destaque: true,
      imagemUrl: 'https://picsum.photos/seed/rotaacessivel/600/400',
    ),
    Solucao(
      id: 2,
      nome: 'Alerta Enchente',
      descricao:
          'Sensores e dados de chuva geram alertas direcionados por bairro '
          'antes de enchentes e deslizamentos.',
      localidade: 'Região metropolitana de SP',
      publicoBeneficiado: 'Moradores de áreas de risco',
      ods: 'ODS 13 - Ação contra o clima',
      categorias: [Categoria.meioAmbiente, Categoria.cidadania],
      destaque: true,
      imagemUrl: 'https://picsum.photos/seed/alertaenchente/600/400',
    ),
    Solucao(
      id: 3,
      nome: 'Saúde Perto',
      descricao:
          'Orientação remota e saúde preventiva para populações distantes '
          'de unidades de atendimento.',
      localidade: 'Comunidades do interior',
      publicoBeneficiado: 'Famílias com atendimento limitado',
      ods: 'ODS 3 - Saúde e bem-estar',
      categorias: [Categoria.saude],
      destaque: true,
      imagemUrl: 'https://picsum.photos/seed/saudeperto/600/400',
    ),
    Solucao(
      id: 4,
      nome: 'AgroSimples',
      descricao:
          'Clima, solo e preços de mercado em linguagem simples para apoiar '
          'a decisão do pequeno produtor rural.',
      localidade: 'Vale do Ribeira - SP',
      publicoBeneficiado: 'Pequenos produtores rurais',
      ods: 'ODS 2 - Fome zero',
      categorias: [Categoria.agricultura, Categoria.meioAmbiente],
      destaque: true,
      imagemUrl: 'https://picsum.photos/seed/agrosimples/600/400',
    ),
    Solucao(
      id: 5,
      nome: 'Zeladoria Colaborativa',
      descricao:
          'Cidadãos registram buracos, lâmpadas queimadas e outros problemas '
          'e acompanham o andamento do reparo.',
      localidade: 'Zona Leste - SP',
      publicoBeneficiado: 'Moradores e agentes públicos',
      ods: 'ODS 11 - Cidades sustentáveis',
      categorias: [Categoria.cidadania, Categoria.mobilidade],
      destaque: false,
      imagemUrl: 'https://picsum.photos/seed/zeladoria/600/400',
    ),
    Solucao(
      id: 6,
      nome: 'Aprenda no Bairro',
      descricao:
          'Mapa de cursos gratuitos e reforço escolar oferecidos por escolas '
          'e ONGs perto de casa.',
      localidade: 'Periferias urbanas',
      publicoBeneficiado: 'Estudantes e jovens trabalhadores',
      ods: 'ODS 4 - Educação de qualidade',
      categorias: [Categoria.educacao, Categoria.cidadania],
      destaque: false,
      imagemUrl: 'https://picsum.photos/seed/aprendabairro/600/400',
    ),
    Solucao(
      id: 7,
      nome: 'Água Certa',
      descricao:
          'Monitora o consumo de água em casas e pequenos negócios e avisa '
          'sobre vazamentos e desperdícios.',
      localidade: 'Campinas - SP',
      publicoBeneficiado: 'Famílias e pequenos comerciantes',
      ods: 'ODS 13 - Ação contra o clima',
      categorias: [Categoria.meioAmbiente],
      destaque: false,
      imagemUrl: 'https://picsum.photos/seed/aguacerta/600/400',
    ),
    Solucao(
      id: 8,
      nome: 'Feira Conectada',
      descricao:
          'Aproxima produtores locais, cooperativas e consumidores para '
          'reduzir perdas e custos de logística.',
      localidade: 'Sorocaba - SP',
      publicoBeneficiado: 'Cooperativas e consumidores locais',
      ods: 'ODS 2 - Fome zero',
      categorias: [Categoria.agricultura, Categoria.cidadania],
      destaque: false,
      imagemUrl: 'https://picsum.photos/seed/feiraconectada/600/400',
    ),
    Solucao(
      id: 9,
      nome: 'Cuidador Conectado',
      descricao:
          'Lembretes de medicação e contato rápido com a família para ampliar '
          'a autonomia e a segurança de idosos.',
      localidade: 'Santos - SP',
      publicoBeneficiado: 'Idosos e cuidadores',
      ods: 'ODS 3 - Saúde e bem-estar',
      categorias: [Categoria.saude, Categoria.cidadania],
      destaque: false,
      imagemUrl: 'https://picsum.photos/seed/cuidadorconectado/600/400',
    ),
  ];

  /// Retorna todas as soluções cadastradas.
  List<Solucao> buscarTodas() => List<Solucao>.unmodifiable(_solucoes);

  /// Retorna apenas as soluções marcadas como destaque.
  List<Solucao> buscarDestaques() {
    return _solucoes.where((solucao) => solucao.destaque).toList();
  }

  /// Retorna as soluções de uma categoria ([Categoria.todas] devolve tudo).
  List<Solucao> buscarPorCategoria(Categoria categoria) {
    return _solucoes.where((solucao) => solucao.pertenceA(categoria)).toList();
  }
}
