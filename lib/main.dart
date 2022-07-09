import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      "questionText": "Favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 7},
        {"text": "Green", "score": 5},
        {"text": "White", "score": 1}
      ]
    },
    {
      "questionText": "Favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 1},
        {"text": "Snake", "score": 10},
        {"text": "Elephant", "score": 5},
        {"text": "Lion", "score": 7}
      ]
    },
    {
      "questionText": "Favorite sport?",
      "answers": [
        {"text": "Cricket", "score": 1},
        {"text": "Football", "score": 7},
        {"text": "Tennis", "score": 10},
        {"text": "Beyblade", "score": 5}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Personality quiz app"),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questions: _questions,
              questionIndex: _questionIndex)
          : Result(_totalscore, _resetQuiz),
    ));
  }
}
