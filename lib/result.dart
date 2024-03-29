import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;

  String get resultPhrase {
    String resultText;
    if (score <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (score <= 12 ) {
      resultText = 'Pretty likeable!';
    } else if (score <= 16) {
      resultText = 'You are strange ?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  Result(this.score, this.resetQuiz);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
              child: Text(
                'Reset the quiz',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}