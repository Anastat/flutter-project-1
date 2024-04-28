import 'package:flutter/material.dart';
import 'package:project_1/widgets/question_widget.dart';

import '../services/question_service.dart';

class IncorrectAnswerWidget extends StatelessWidget {
  final Question question;

  const IncorrectAnswerWidget(this.question);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Column(children: [
      const SizedBox(height: 20),
      const Text("Incorrect answer! Try again!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.red)),
      QuestionWidget(question),
    ]));
  }
}
