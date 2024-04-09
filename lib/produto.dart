import 'package:flutter/material.dart';

void main() {
  runApp(const Produto()); // inicia o aplicativo com o widget Produto
}

class Produto extends StatelessWidget {
  const Produto({super.key}); // construtor da classe Produto

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
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String _textoInfo = "Informe os dados!";

  void _cadastrarUsuario() {
    setState(() {
      String usuario = usuarioController.text;
      String senha = senhaController.text;

      if (senha.isEmpty) {
        _textoInfo = "Informe os dados corretamente!";
      } else if (usuario.isEmpty) {
        _textoInfo = "Informe os dados corretamente!";
      } else {
        setState(() {
          _textoInfo = "Dados cadastrados com sucesso!";
          usuarioController.text = "";
          senhaController.text = "";
        });
      }
    });
  }

  void _limparTela() {
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textoInfo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Produto"), // título da barra de aplicativo
        centerTitle: true, // centraliza o título
        backgroundColor: Colors.purpleAccent, // cor de fundo da barra de aplicativo
        actions: <Widget>[
          IconButton(
            onPressed: _limparTela,
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
              Icons.add_business, // icone de adicionar produto
              size: 125.0,
              color: Colors.purpleAccent, // cor do ícone
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome:", // rótulo do campo de texto para o nome
                labelStyle: TextStyle(color: Colors.purpleAccent), // estilo do rótulo
              ),
              textAlign: TextAlign.center, // alinhamento do texto centralizado
              style: TextStyle(fontSize: 25.0), // estilo do texto
              controller: usuarioController, // controlador para o campo de texto do nome
            ),
            TextField(
              obscureText: true, // oculta o texto digitado
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Descrição:", // rótulo do campo de texto para a descrição
                labelStyle: TextStyle(color: Colors.purpleAccent), // estilo do rótulo
              ),
              textAlign: TextAlign.center, // alinhamento do texto centralizado
              style: TextStyle(fontSize: 25.0), // estilo do texto
              controller: senhaController, // controlador para o campo de texto da descrição
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10), // preenchimento superior e inferior
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _cadastrarUsuario, // ação ao pressionar o botão
                  child: const Text("Cadastrar Produto"), // texto do botão
                ),
              ),
            ),
            Text(
              _textoInfo, // texto dinâmico com informações sobre o cadastro
              textAlign: TextAlign.center, // alinhamento do texto centralizado
              style: TextStyle(
                color: Colors.purpleAccent, // cor do texto
                fontSize: 25.0, // tamanho do texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}