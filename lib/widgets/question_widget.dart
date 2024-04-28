import 'package:flutter/material.dart';
import 'package:project_1/widgets/option_widget.dart';

import '../models/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  const QuestionWidget(this.question);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Column(
      children: [
        const SizedBox(height: 20),
        Text(question.question,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 31, 21, 62))),
        const SizedBox(height: 20),
        if (question.imageUrl != null) Image.network(question.imageUrl!),
        Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: question.options
                  .map((option) => OptionWidget(option, question))
                  .toList(),
            ))
      ],
    ));
  }
}
