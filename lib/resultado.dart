import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() onReiniciarAppQuiz;

  Resultado(this.pontuacao, this.onReiniciarAppQuiz);

  String get fraseResultado {
    if (pontuacao < 10) {
      return 'Parabéns!';
    } else if (pontuacao < 20) {
      return 'Você é bom!';
    } else if (pontuacao < 29) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 32),
          ),
        ),
        FlatButton(
          child: Text(
            'Reinciar',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: onReiniciarAppQuiz,
        )
      ],
    );
  }
}
