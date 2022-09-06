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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QuestionWidget(
            question: _questions[_questionIndex],
            nextQuestion: nextQuestion,
          )
        ],
      ),
    ));
  }

  void nextQuestion() {
    (_questionIndex + 1) < _questions.length
        ? setState(() {
            _questionIndex += 1;
          })
        : _questionIndex;
  }
}
