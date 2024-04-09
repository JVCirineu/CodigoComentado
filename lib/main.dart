import 'package:flutter/material.dart';
import 'principal.dart';      // importa a tela principal do aplicativo


void main() {
  runApp(const MyApp());        // inicia o aplicativo
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});              // construtor da classe MyApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // retorna o MaterialApp, widget de nível superior para um aplicativo Material Design
        debugShowCheckedModeBanner: false, // desativa o banner de debug no canto superior direito
        title: 'Rotas Nomeadas', // define o título do aplicativo
        home: Principal(), // define a tela inicial como a tela Principal
        /*initialRoute: '/',
        routes: {
          '/': (context) => Principal(),
          '/imc': (context) => const Imc(),
          '/contador': (context) => const Contador(),
          '/usuario': (context) => const Usuario(),
          '/produto': (context) => const Produto(),
        }*/
    );
  }
}