import 'package:flutter/material.dart';
import 'dart:convert';

import '../../modelos/receitas.dart';
import '../detalhes/detalhes.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      body: SizedBox(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
          builder: (context, snapshot) {
            List<dynamic> receitas = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Receita receita = Receita.fromJson(receitas[index]);
                return _construirCard(receita);
              },
              itemCount: receitas == null ? 0 : receitas.length,
            );
          },
        ),
      ),
      appBar: _construirAppBar('Cozinhando em Casa'),
    );
  }

  Widget _construirCard(Receita receita) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _construirImagemCard(receita.foto),
                _construirImagemGradienteCard(),
                _construirTituloCard(receita.titulo),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detalhes(receita: receita),
          ),
        );
      },
    );
  }

  Widget _construirImagemCard(String imagem) {
    return Image.asset(
      imagem,
      fit: BoxFit.fill,
      height: 238,
    );
  }

  Widget _construirTituloCard(String titulo) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(
      title: Text(titulo),
    );
  }

  Widget _construirImagemGradienteCard() {
    return Container(
      height: 238,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7),
          ],
        ),
      ),
    );
  }
}
