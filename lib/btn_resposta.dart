import 'package:flutter/material.dart';

class BtnResposta extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  BtnResposta(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),//
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(
          texto,
          style: TextStyle(fontSize: 18),
        ),
        onPressed: onSelection,
      ),
    );
  }
}
