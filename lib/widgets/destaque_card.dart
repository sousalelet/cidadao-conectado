import 'package:flutter/material.dart';

import '../models/solucao.dart';
import 'imagem_com_fallback.dart';
import 'info_linha.dart';

/// Card da lista horizontal de destaques.
class DestaqueCard extends StatelessWidget {
  const DestaqueCard({super.key, required this.solucao, required this.onTap});

  final Solucao solucao;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return SizedBox(
      width: 220,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(0, 2, 12, 6),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ImagemComFallback(
                  url: solucao.imagemUrl,
                  icone: solucao.categoriaPrincipal.icone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      solucao.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: tema.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InfoLinha(
                      icone: Icons.place_outlined,
                      texto: solucao.localidade,
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
