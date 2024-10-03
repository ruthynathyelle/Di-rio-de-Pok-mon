import 'package:flutter/material.dart';
import 'package:diariodepokemon/view/pagina_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diário de Pokémon',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: PaginaInicial(),
    );
  }
}