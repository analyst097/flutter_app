import 'package:flutter/material.dart';
import 'models/models.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function nextQuestion;
  QuestionWidget(
      {required this.question, required this.nextQuestion, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                for (var option in question.options)
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => selectedAnswer(question, option),
                        child: Text(option)),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  selectedAnswer(Question question, String answer) {
    question.answer = answer;
    nextQuestion();
    print(question.question);
    print(answer);
  }
}
