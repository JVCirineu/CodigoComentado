
import 'package:flutter/material.dart';
import 'produto.dart';
import 'usuario.dart';
import 'imc.dart';
import 'contador.dart';

class Principal extends StatefulWidget {
  const Principal({super.key}); // construtor da classe Principal

  @override
  State<Principal> createState() => _HomePageState(); // cria o estado associado à classe Principal
}

class _HomePageState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // scaffold é um widget que implementa o layout básico de uma tela Material Design
      appBar: AppBar( // barra de aplicativo
        title: Text("MENU"), // título da barra de aplicativo
        centerTitle: true, // centraliza o título
        backgroundColor: Colors.indigo, // cor de fundo da barra de aplicativo
      ),

      body: SingleChildScrollView( // corpo da tela, com capacidade de rolar
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), // preenchimento ao redor do corpo
        child: Column( //  coluna de widgets
          crossAxisAlignment: CrossAxisAlignment.stretch, // alinha os widgets ao longo do eixo principal (horizontal)
          children: <Widget>[ // lista de widgets filhos
            const Icon( // icone
              Icons.add_business_sharp,
              size: 120.0,
              color: Colors.indigo,
            ),
            Text( // texto
              "Aplicação Principal", // conteúdo do texto
              textAlign: TextAlign.center, // alinhamento do texto
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0), // estilo do texto
            ),
            Text( // texto vazio para espaço
              "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
            ),
            Column( // coluna de botões
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton( // botão elevado
                      child: const Text("IMC"), // texto do botão
                      onPressed: () { // ação ao pressionar o botão
                        Navigator.push( // navegação para outra tela
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Imc()), // constrói a tela do IMC
                        );
                      }),
                  ElevatedButton(
                      child: const Text("Contador"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Contador()),
                        );
                      }),
                  ElevatedButton(
                      child: const Text("Cadastro Usuario"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Usuario()),
                        );
                      }),
                  ElevatedButton(
                      child: const Text("Cadastro de Produtos"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Produto()),
                        );
                      }),
                ]),
          ],
        ),
      ), // Botão para executar o calculo do IMC,
    );
  }
}
