import 'package:flutter/material.dart';

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

    var questions = [
      'What\'s your favorite color ?',
      'What\'s your favorite animal ?',
    ];

    var answers = [
      ['red', 'black', 'white'],
      ['cat', 'dog', 'fish'],
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first Title'),
        ),
        body: Column(
          children: [
            Text(questions.elementAt(_questionIndex)),
            RaisedButton(
              child: Text(answers[_questionIndex][0]),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text(answers[_questionIndex][1]),
              onPressed: () => print('answer 2 chosen'),
            ),
            RaisedButton(
              child: Text(answers[_questionIndex][2]),
              onPressed: () {
                print('answer 3 chosen');
              },
              ),
                Text('questionIndex: ${_questionIndex}'),
          ],
        ),
      ),
    );

  }

}