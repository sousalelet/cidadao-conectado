import 'package:flutter/material.dart';

/// Linha com um ícone pequeno seguido de um texto (informação complementar).
class InfoLinha extends StatelessWidget {
  const InfoLinha({
    super.key,
    required this.icone,
    required this.texto,
    this.estilo,
    this.maxLinhas = 1,
  });

  final IconData icone;
  final String texto;
  final TextStyle? estilo;
  final int maxLinhas;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, size: 16, color: tema.colorScheme.primary),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              texto,
              maxLines: maxLinhas,
              overflow: TextOverflow.ellipsis,
              style: estilo ?? tema.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
