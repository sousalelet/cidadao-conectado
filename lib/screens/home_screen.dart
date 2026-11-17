import 'package:flutter/material.dart';

import '../models/categoria.dart';
import '../models/solucao.dart';
import '../repositories/solucao_repository.dart';
import '../widgets/categoria_chip.dart';
import '../widgets/destaque_card.dart';
import '../widgets/secao_titulo.dart';
import '../widgets/solucao_card.dart';
import 'detalhe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SolucaoRepository _repository = const SolucaoRepository();

  late final List<Solucao> _destaques;
  late List<Solucao> _solucoesFiltradas;

  Categoria _categoriaSelecionada = Categoria.todas;

  @override
  void initState() {
    super.initState();

    _destaques = _repository.buscarDestaques();
    _solucoesFiltradas = _repository.buscarPorCategoria(_categoriaSelecionada);
  }

  void _selecionarCategoria(Categoria categoria) {
    setState(() {
      _categoriaSelecionada = categoria;
      _solucoesFiltradas = _repository.buscarPorCategoria(categoria);
    });
  }

  void _abrirDetalhe(Solucao solucao) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetalheScreen(solucao: solucao)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cidadão Conectado')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SecaoTitulo(titulo: 'Em destaque', icone: Icons.star),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _destaques.length,
                itemBuilder: (context, index) {
                  final solucao = _destaques[index];

                  return DestaqueCard(
                    solucao: solucao,
                    onTap: () => _abrirDetalhe(solucao),
                  );
                },
              ),
            ),
            const SecaoTitulo(titulo: 'Categorias', icone: Icons.filter_list),
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: Categoria.values.length,
                itemBuilder: (context, index) {
                  final categoria = Categoria.values[index];

                  return CategoriaChip(
                    categoria: categoria,
                    selecionada: categoria == _categoriaSelecionada,
                    onSelecionada: () => _selecionarCategoria(categoria),
                  );
                },
              ),
            ),
            SecaoTitulo(
              titulo: 'Soluções (${_solucoesFiltradas.length})',
              icone: Icons.lightbulb_outline,
            ),
            Expanded(
              child: _solucoesFiltradas.isEmpty
                  ? const Center(
                      child: Text('Nenhuma solução nesta categoria.'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      itemCount: _solucoesFiltradas.length,
                      itemBuilder: (context, index) {
                        final solucao = _solucoesFiltradas[index];

                        return SolucaoCard(
                          solucao: solucao,
                          onTap: () => _abrirDetalhe(solucao),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
