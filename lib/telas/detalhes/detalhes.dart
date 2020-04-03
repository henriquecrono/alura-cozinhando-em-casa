import 'package:flutter/material.dart';

import 'package:cozinhando_casa/modelos/receitas.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;

  const Detalhes({Key key, this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
        appBar: _construirAppBar("Cozinhando em Casa"),
        body: ListView(
          children: <Widget>[
            _construirImagemDetalhes(receita.foto),
            _construirTituloDetalhes(receita.titulo),
            _construirLinhaIconesDetalhes(
                receita.tempoPreparo, receita.porcoes),
            _construirSubtituloDetalhes("Ingredientes"),
            _construirTextoPreparoDetalhes(receita.ingredientes),
            _construirSubtituloDetalhes("Modo de preparo"),
            _construirTextoPreparoDetalhes(receita.modoPreparo),
          ],
        ));
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(
      title: Text(titulo),
    );
  }

  Widget _construirImagemDetalhes(String imagem) {
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(String titulo) {
    return Center(
      child: Text(
        titulo,
        style: TextStyle(color: Colors.deepOrange, fontSize: 30),
      ),
    );
  }

  Widget _construirSubtituloDetalhes(String subtitulo) {
    return Center(
      child: Text(
        subtitulo,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _construirTextoIngredientesDetalhes(String texto) {
    var split = texto.split(';').map((i) {
      if (i == "") {
        return Divider();
      } else {
        return Text(i, textAlign: TextAlign.start,);
      }
    }).toList();
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: split,
      ),
    );
  }

  Widget _construirTextoPreparoDetalhes(String texto) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(texto, textAlign: TextAlign.justify),
    );
  }

  Widget _construirColuna(String dado, IconData icone) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Icon(icone, color: Colors.deepOrange),
            Text(
              dado,
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _construirLinhaIconesDetalhes(String tempo, String rendimento) {
    return Row(
      children: <Widget>[
        _construirColuna(tempo, Icons.timer),
        _construirColuna(rendimento, Icons.restaurant)
      ],
    );
  }
}
