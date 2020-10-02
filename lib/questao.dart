import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //Pega a largura total da tela
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20) ,//
      child: Text(
          texto,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
    );
  }
}
