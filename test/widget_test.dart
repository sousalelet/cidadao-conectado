import 'package:flutter_test/flutter_test.dart';

import 'package:cidadao_conectado/main.dart';

void main() {
  testWidgets('tela principal exibe a categoria Todas', (tester) async {
    await tester.pumpWidget(const CidadaoConectadoApp());

    expect(find.text('Todas'), findsOneWidget);
  });
}
