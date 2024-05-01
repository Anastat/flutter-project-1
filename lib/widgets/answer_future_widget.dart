import 'package:flutter/material.dart';

import 'correct_answer_widget.dart';
import 'incorrect_answer_widget.dart';

class AnswerFutureWidget extends StatelessWidget {
  final Future<bool> answer;
  final int topicId;
  const AnswerFutureWidget(this.answer, this.topicId);

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
              ? CorrectAnswerWidget(topicId)
              : IncorrectAnswerWidget();
        }
      },
    );
  }
}
