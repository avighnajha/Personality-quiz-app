import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        "questionText": "Favorite color?",
        "answers": ["Black", "Red", "Green", "White"]
      },
      {
        "questionText": "Favorite animal?",
        "answers": ["Rabbit", "Snake", "Elephant", "Lion"]
      },
      {
        "questionText": "Favorite sport?",
        "answers": ["Cricket", "Football", "Tennis", "Beyblade"]
      }
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Personality quiz app"),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]["questionText"] as String),
          ...(questions[_questionIndex]["answers"] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}
