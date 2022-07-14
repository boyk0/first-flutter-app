import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main () => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': ['red', 'black', 'white', 'yellow'],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': ['cat', 'dog', 'fish'],
    },
    {
      'questionText': 'What\'s your favorite food ?',
      'answers': ['pizza', 'pizza', 'pizza', 'pizza'],
    },
  ];

  void _answerQuestion() {
    if(_questionIndex < _questions.length) {
      setState(() => _questionIndex++);
    }
    print('answer chosen index: ${_questionIndex}');
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first Title'),
        ),
        body: _questionIndex < _questions.length ? Column(
          children: [
            Quiz(answerQuestion: _answerQuestion, questions: _questions, questionIndex: _questionIndex),
          ],
        ) : Result(),
      ),
    );

  }

}