import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/widgets/answer_future_widget.dart';
import 'package:project_1/widgets/option_widget.dart';

import '../models/question.dart';
import '../providers/answer_provider.dart';
import '../services/answer_api.dart';

class QuestionWidget extends ConsumerWidget {
  final Question question;
  final int topicId;
  const QuestionWidget(this.question, this.topicId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOption = ref.watch(answerProvider);

    void selectOption(option) {
      ref.watch(answerProvider.notifier).update((state) => option);
    }
    // TODO: Hide question and options if answer is correct.

    return IntrinsicWidth(
        child: Column(
      children: [
        if (selectedOption != '')
          AnswerFutureWidget(
              AnswerApi().postAnswer(topicId, question.id, selectedOption),
              topicId),
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
                  .map((option) => OptionWidget(selectOption, option))
                  .toList(),
            ))
      ],
    ));
  }
}
