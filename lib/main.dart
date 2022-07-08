import 'package:flutter/material.dart';
import './question.dart';

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
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex += 1;
    });
    print("Answer Chosen");
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["Favorite color?", "Favorite animal?"];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Personality quiz app"),
      ),
      body: Column(
        children: [
          Question(questions[questionIndex]),
          RaisedButton(child: Text("Answer 1"), onPressed: answerQuestion),
          RaisedButton(child: Text("Answer 2"), onPressed: answerQuestion),
          RaisedButton(child: Text("Answer 3"), onPressed: answerQuestion)
        ],
      ),
    ));
  }
}
