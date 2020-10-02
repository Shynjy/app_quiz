import 'package:flutter/material.dart';
import 'questao.dart';
import 'btn_resposta.dart';

void main() => runApp(AppQuiz());

class _AppQuizState extends State<AppQuiz> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      if (_perguntaSelecionada == 2) {
        _perguntaSelecionada = 0;
      } else {
        _perguntaSelecionada++;
      }
    });
  }

  final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Vermelho', 'Azul', 'Amarelo', 'Verde'],
      },
      {
        'texto': 'Qual é o seu animal favorita?',
        'respostas': ['Cachorro', 'Gato', 'Papagaio', 'Coelho'],
      },
      {
        'texto': 'Qual é o seu instrutor favorita?',
        'respostas': ['Leonardo Moura Leitão', 'Mario Souto', 'Felipe Deschamps', 'Gustavo Guanabara'],
      }
  ];

  @override
  Widget build(BuildContext context) {
    
    // Forma imperativa de criar os botões
    List<Widget> respostas = [];

    for (String textResp in perguntas[_perguntaSelecionada]['respostas']) {
      respostas.add(Resposta(textResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class AppQuiz extends StatefulWidget {
  _AppQuizState createState() {
    return _AppQuizState();
  }
}
