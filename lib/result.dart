import 'dart:ffi';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback resetHandler;
  final int resultScore;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = "You are a good person";
    } else if (resultScore <= 12) {
      resultText = "You are a decent person";
    } else if (resultScore <= 16) {
      resultText = "You are a weirdo";
    } else {
      resultText = "You are a bad person";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        RaisedButton(
            child: Text("Reset Quiz"),
            textColor: Colors.blue,
            onPressed: resetHandler)
      ],
    ));
  }
}
