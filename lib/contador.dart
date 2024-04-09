import 'package:flutter/material.dart';

void main() {
  runApp(const Contador()); // inicia o aplicativo com o widget Contador
}

class Contador extends StatelessWidget {
  const Contador({super.key}); // construtor da classe Contador

  // constrói o widget principal do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // título do aplicativo
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent), // esquema de cores
        useMaterial3: true, // habilita o uso do Material3
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), // define a tela inicial como MyHomePage
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // construtor da classe MyHomePage

  final String title; // título da página

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // cria o estado associado à classe MyHomePage
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // variável para armazenar o contador

  // incrementa o contador
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // decrementa o contador
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // cor de fundo da barra de aplicativo
        title: Text(widget.title), // título da barra de aplicativo
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:', // texto estático
            ),
            Text(
              '$_counter', // valor do contador
              style: Theme.of(context).textTheme.headlineMedium, // estilo do texto
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementCounter, // ação ao pressionar o botão de incremento
                  child: const Icon(Icons.add), // icone de adição
                ),
                ElevatedButton(
                  onPressed: _decrementCounter, // ação ao pressionar o botão de decremento
                  child: const Icon(Icons.remove), // icone de remoção
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}