import 'package:flutter/material.dart';

import '../models/solucao.dart';
import 'imagem_com_fallback.dart';
import 'info_linha.dart';

/// Card de um registro da lista vertical principal.
class SolucaoCard extends StatelessWidget {
  const SolucaoCard({super.key, required this.solucao, required this.onTap});

  final Solucao solucao;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagemComFallback(
                url: solucao.imagemUrl,
                icone: solucao.categoriaPrincipal.icone,
                largura: 88,
                altura: 88,
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      solucao.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: tema.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      solucao.descricao,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: tema.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    InfoLinha(
                      icone: Icons.place_outlined,
                      texto: solucao.localidade,
                    ),
                    InfoLinha(
                      icone: Icons.people_outline,
                      texto: solucao.publicoBeneficiado,
                    ),
                    InfoLinha(icone: Icons.public, texto: solucao.ods),
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
