import 'package:flutter/material.dart';

import 'correct_answer_widget.dart';
import 'incorrect_answer_widget.dart';

import '../services/question_service.dart';

class AnswerFutureWidget extends StatelessWidget {
  final Question question;
  final Future<bool> answer;
  final String questionPath;
  const AnswerFutureWidget(this.question, this.answer, this.questionPath);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: answer,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Verifying your answer.");
        } else if (snapshot.hasError) {
          return Text("Error verifying answer: ${snapshot.error}");
        } else if (!snapshot.hasData) {
          return const Text("No answer.");
        } else {
          bool answer = snapshot.data!;
          return answer
              ? CorrectAnswerWidget(questionPath)
              : IncorrectAnswerWidget(question);
        }
      },
    );
  }
}
