import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Imc()); // inicia o aplicativo com o widget Imc
}

class Imc extends StatelessWidget {
  const Imc({super.key}); // construtor da classe Imc

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // desativa o banner de debug no canto superior direito
      home: const Home(), // define a tela inicial como Home
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key}); // construtor da classe Home

  @override
  State<Home> createState() => _HomeState(); // cria o estado associado à classe Home
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _textoInfo = "Informe seus dados!";

  // método para limpar os campos de texto
  void _limparTela() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo = "";
    });
  }

  // método para calcular o IMC
  void _calcular_Imc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / pow((altura / 100), 2);

      // verifica o intervalo do IMC e atribui uma mensagem correspondente
      if (imc < 16.5) {
        _textoInfo = "Desnutrido (${imc.toStringAsFixed(2)})";
      } else if (imc <= 18.5) {
        _textoInfo = "Abaixo do Peso (${imc.toStringAsFixed(2)})";
      } else if (imc <= 24.9) {
        _textoInfo = "Peso Ideal (${imc.toStringAsFixed(2)})";
      } else if (imc <= 29.9) {
        _textoInfo = "Sobre Peso (${imc.toStringAsFixed(2)})";
      } else if (imc <= 34.9) {
        _textoInfo = "Obesidade Grau I(${imc.toStringAsFixed(2)})";
      } else {
        _textoInfo = "Obesidade Grau II(${imc.toStringAsFixed(2)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"), // título da barra de aplicativo
        centerTitle: true, // centraliza o título
        backgroundColor: Colors.green, // cor de fundo da barra de aplicativo
        actions: <Widget>[
          IconButton(
            onPressed: _limparTela, // ação ao pressionar o botão de limpar tela
            icon: Icon(Icons.refresh), // icone de atualização
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), // preenchimento ao redor do corpo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // alinha os widgets ao longo do eixo principal (horizontal)
          children: <Widget>[
            const Icon(
              Icons.person_outline, // icone de pessoa
              size: 120.0,
              color: Colors.green, // cor do ícone
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "PESO(KG)", // rótulo do campo de texto para o peso
                labelStyle: TextStyle(color: Colors.green), // estilo do rótulo
              ),
              textAlign: TextAlign.center, // alinhamento do texto centralizado
              style: TextStyle(fontSize: 25.0), // estilo do texto
              controller: pesoController, // controlador para o campo de texto do peso
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "ALTURA(CM)", // rótulo do campo de texto para a altura
                labelStyle: TextStyle(color: Colors.green), // estilo do rótulo
              ),
              textAlign: TextAlign.center, // alinhamento do texto centralizado
              style: TextStyle(fontSize: 25.0), // estilo do texto
              controller: alturaController, // controlador para o campo de texto da altura
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10), // preenchimento superior e inferior
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _calcular_Imc, // ação ao pressionar o botão de calcular IMC
                  child: const Text("Calcular"), // texto do botão
                ),
              ),
            ),
            Text(
              _textoInfo, // texto dinâmico com informações sobre o IMC calculado
              textAlign: TextAlign.center, // alinhamento do texto centralizado
              style: TextStyle(
                color: Colors.green, // cor do texto
                fontSize: 25.0, // tamanho do texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}