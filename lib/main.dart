import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const CidadaoConectadoApp());
}

class CidadaoConectadoApp extends StatelessWidget {
  const CidadaoConectadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cidadão Conectado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
