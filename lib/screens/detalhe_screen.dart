import 'package:flutter/material.dart';

import '../models/solucao.dart';
import '../widgets/imagem_com_fallback.dart';
import '../widgets/info_linha.dart';

/// Tela de detalhes de uma solução (aberta ao tocar em um card).
class DetalheScreen extends StatelessWidget {
  const DetalheScreen({super.key, required this.solucao});

  final Solucao solucao;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(solucao.nome)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagemComFallback(
                url: solucao.imagemUrl,
                icone: solucao.categoriaPrincipal.icone,
                largura: double.infinity,
                altura: 220,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      solucao.nome,
                      style: tema.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: solucao.categorias.map((categoria) {
                        return Chip(
                          avatar: Icon(categoria.icone, size: 18),
                          label: Text(categoria.rotulo),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    Text(solucao.descricao, style: tema.textTheme.bodyLarge),
                    const SizedBox(height: 16),
                    const Divider(),
                    InfoLinha(
                      icone: Icons.place_outlined,
                      texto: solucao.localidade,
                      estilo: tema.textTheme.bodyMedium,
                      maxLinhas: 3,
                    ),
                    InfoLinha(
                      icone: Icons.people_outline,
                      texto: solucao.publicoBeneficiado,
                      estilo: tema.textTheme.bodyMedium,
                      maxLinhas: 3,
                    ),
                    InfoLinha(
                      icone: Icons.public,
                      texto: solucao.ods,
                      estilo: tema.textTheme.bodyMedium,
                      maxLinhas: 3,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Voltar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
