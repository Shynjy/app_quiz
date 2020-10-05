import 'package:flutter/material.dart';
import 'questao.dart';
import 'btn_resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Forma imperativa de criar os botões
    // List<Widget> respostas = [];

    // for (String textResp in _perguntas[_perguntaSelecionada]['respostas']) {
    //   respostas.add(BtnResposta(textResp, _responder));
    // }

    // Forma Declarativa de criar os botões
    List<Map<String, Object>> respostas = temPerguntaSelecionada
    ? perguntas[perguntaSelecionada]['respostas']
    : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((resp) => 
        BtnResposta(resp['texto'], 
        () => quandoResponder(resp['pontuacao'])))
        .toList(),
      ],
    );
  }
}
