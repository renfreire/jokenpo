import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemapp = const AssetImage("img/padrao.png");
  var _mensagem = "Faça sua Escolha";

  void opcaoSelecionada(String opcaoUsuario) {
    var opcoes = const ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var opcaoApp = opcoes[numero];

    switch (opcaoApp) {
      case "pedra":
        setState(() {
          _imagemapp = const AssetImage("img/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemapp = const AssetImage("img/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemapp = const AssetImage("img/tesoura.png");
        });
        break;
    }

    //valida o ganhador
    if ((opcaoUsuario == "pedra" && opcaoApp == "tesoura") ||
        (opcaoUsuario == "tesoura" && opcaoApp == "papel") ||
        (opcaoUsuario == "papel" && opcaoApp == "pedra")) {
      setState(() {
        _mensagem = "Parabéns!! Você ganhou!";
      });
    } else if ((opcaoApp == "pedra" && opcaoUsuario == "tesoura") ||
        (opcaoApp == "tesoura" && opcaoUsuario == "papel") ||
        (opcaoApp == "papel" && opcaoUsuario == "pedra")) {
      setState(() {
        _mensagem = "Você perdeu :(";
      });
    } else {
      setState(() {
        _mensagem = "Empatou";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo Game"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 20, 8, 15),
            child: Text(
              "Escolha do App",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _imagemapp,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
            child: Text(
              _mensagem,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: Image.asset(
                  "img/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("papel"),
                child: Image.asset(
                  "img/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "img/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
