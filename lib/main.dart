import 'package:flutter/material.dart';
import 'resultado.dart';
import 'questionario.dart';

void main() => runApp(AppQuiz());

class _AppQuizState extends State<AppQuiz> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 7},
        {'texto': 'Amarelo', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorita?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 7},
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Papagaio', 'pontuacao': 2},
        {'texto': 'Coelho', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorita?',
      'respostas': [
        {'texto': 'Leonardo Moura Leitão', 'pontuacao': 7},
        {'texto': 'Mario Souto', 'pontuacao': 5},
        {'texto': 'Fernando Daciuk', 'pontuacao': 10},
        {'texto': 'Gustavo Guanabara', 'pontuacao': 3},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarAppQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarAppQuiz)),
    );
  }
}

class AppQuiz extends StatefulWidget {
  _AppQuizState createState() {
    return _AppQuizState();
  }
}
