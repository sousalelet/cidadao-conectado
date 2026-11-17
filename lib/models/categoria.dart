import 'package:flutter/material.dart';

/// Categorias usadas para classificar e filtrar as soluções CitizenTech.
///
/// O valor [todas] existe apenas para o filtro (mostra tudo) e não deve ser
/// atribuído a nenhuma solução.
enum Categoria {
  todas('Todas', Icons.apps),
  mobilidade('Mobilidade', Icons.directions_bus),
  saude('Saúde', Icons.health_and_safety),
  educacao('Educação', Icons.school),
  meioAmbiente('Meio ambiente', Icons.water_drop),
  agricultura('Agricultura', Icons.agriculture),
  cidadania('Cidadania', Icons.groups);

  const Categoria(this.rotulo, this.icone);

  final String rotulo;
  final IconData icone;
}
