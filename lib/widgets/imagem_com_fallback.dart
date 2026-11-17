import 'package:flutter/material.dart';

/// Imagem da internet com indicador de carregamento e um ícone de
/// substituição caso a imagem não possa ser carregada (ex.: sem internet).
class ImagemComFallback extends StatelessWidget {
  const ImagemComFallback({
    super.key,
    required this.url,
    required this.icone,
    this.largura,
    this.altura,
    this.borderRadius = BorderRadius.zero,
  });

  final String url;
  final IconData icone;
  final double? largura;
  final double? altura;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        width: largura,
        height: altura,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progresso) {
            if (progresso == null) {
              return child;
            }

            return Container(
              color: cores.surfaceContainerHighest,
              alignment: Alignment.center,
              child: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          },
          errorBuilder: (context, erro, stackTrace) {
            return Container(
              color: cores.secondaryContainer,
              alignment: Alignment.center,
              child: Icon(icone, size: 32, color: cores.onSecondaryContainer),
            );
          },
        ),
      ),
    );
  }
}
