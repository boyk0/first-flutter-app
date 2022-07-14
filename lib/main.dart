import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main () => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() => _questionIndex++);
    print('answear chosen index: ${_questionIndex}');
  }

  @override
  Widget build(BuildContext context) {

    const questions = const [
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first Title'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
            Text('questionIndex: ${_questionIndex}'),
          ],
        ),
      ),
    );

  }

}