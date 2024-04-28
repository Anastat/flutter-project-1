import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../models/question.dart';

class OptionWidget extends StatelessWidget {
  final String option;
  final Question question;

  const OptionWidget(this.option, this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () => context.go(
                Uri(
                    path: question.answerPostPath,
                    queryParameters: {'answer': option}).toString(),
                extra: question),
            child: Text(option)));
  }
}
