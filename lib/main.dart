import 'package:flutter/material.dart';
import 'package:notemaker/question.dart';

import 'models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final List<Question> _questions = [
    Question(
        question: 'What is your gender?',
        options: ['Male', 'Female', 'Other', 'Prefer not to say']),
    Question(
        question: 'What is you age group?',
        options: ['16-20', '20-30', '30-40', '40-50']),
    Question(
        question: 'What is your relationship status?',
        options: ['Single', 'In a relationship', 'Married', 'None']),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QuestionWidget(
                  question: _questions[_questionIndex],
                  nextQuestion: nextQuestion,
                )
              ],
            )
          : Column(
              children: [
                Container(
                  color: Colors.greenAccent,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    onPressed: () => setState(() {
                          _questionIndex = 0;
                        }),
                    child: Text('Reset'))
              ],
            ),
    ));
  }

  void nextQuestion() {
    _questionIndex < _questions.length
        ? setState(() {
            _questionIndex += 1;
          })
        : _questionIndex;
  }
}
