import 'package:flutter/material.dart';
import 'models/models.dart';

class QuestionWidget extends StatelessWidget {
  Question question;
  Function nextQuestion;
  QuestionWidget(
      {required this.question, required this.nextQuestion, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(question.question),
          Row(
            children: [
              for (var option in question.options)
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => selectedAnswer(question, option),
                        child: Text(option)))
            ],
          )
        ],
      ),
    );
  }

  selectedAnswer(Question question, String answer) {
    question.answer = answer;
    this.nextQuestion();
    print(question.question);
    print(answer);
  }
}
