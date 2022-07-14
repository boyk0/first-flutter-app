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
  int _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'red', 'score': 0},
        {'text': 'black', 'score': 1},
        {'text': 'white', 'score': 2},
        {'text': 'yellow', 'score': 3},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'cat', 'score': 0},
        {'text': 'dog', 'score': 1},
        {'text': 'fish', 'score': 2},
      ]
    },
    {
      'questionText': 'What\'s your favorite food ?',
      'answers': [
        {'text': 'pizza', 'score': 1},
        {'text': 'pizza', 'score': 2},
        {'text': 'pizza', 'score': 3},
        {'text': 'pizza', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite car ?',
      'answers': [
        {'text': 'black', 'score': 1},
        {'text': 'white', 'score': 2},
        {'text': 'green', 'score': 3},
        {'text': 'red (+1 HP)', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite time ?',
      'answers': [
        {'text': 'morning', 'score': 1},
        {'text': 'day', 'score': 2},
        {'text': 'evening', 'score': 3},
        {'text': 'night', 'score': 4},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }


  void _answerQuestion(int score) {
    if(_questionIndex < _questions.length) {
      setState(() => _questionIndex++);
    }
    _totalScore += score;
    print('answer chosen index: ${_questionIndex}');
    print('total score is ${_totalScore}');
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
        ) : Result(_totalScore, _resetQuiz),
      ),
    );

  }

}