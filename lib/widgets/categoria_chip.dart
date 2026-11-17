import 'package:flutter/material.dart';

import '../models/categoria.dart';

/// Chip de categoria da lista horizontal de filtros.
/// A categoria selecionada é destacada com a cor primária do tema.
class CategoriaChip extends StatelessWidget {
  const CategoriaChip({
    super.key,
    required this.categoria,
    required this.selecionada,
    required this.onSelecionada,
  });

  final Categoria categoria;
  final bool selecionada;
  final VoidCallback onSelecionada;

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Center(
        child: ChoiceChip(
          avatar: Icon(
            categoria.icone,
            size: 18,
            color: selecionada ? cores.onPrimary : cores.primary,
          ),
          label: Text(categoria.rotulo),
          labelStyle: TextStyle(
            color: selecionada ? cores.onPrimary : cores.onSurface,
            fontWeight: selecionada ? FontWeight.bold : FontWeight.normal,
          ),
          selected: selecionada,
          showCheckmark: false,
          selectedColor: cores.primary,
          onSelected: (_) => onSelecionada(),
        ),
      ),
    );
  }
}
