import 'package:flutter/material.dart';

/// Título de seção com ícone, usado acima de cada lista da tela principal.
class SecaoTitulo extends StatelessWidget {
  const SecaoTitulo({super.key, required this.titulo, required this.icone});

  final String titulo;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
      child: Row(
        children: [
          Icon(icone, color: tema.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              titulo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: tema.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
