import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/widgets/answer_future_widget.dart';
import 'package:project_1/widgets/option_widget.dart';

import '../models/question.dart';
import '../providers/answer_provider.dart';
import '../services/answer_api.dart';

class QuestionWidget extends ConsumerStatefulWidget {
  final Question question;
  final int topicId;

  const QuestionWidget(this.question, this.topicId, {Key? key})
      : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends ConsumerState<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    final selectedOption = ref.watch(answerProvider);

    void selectOption(option) {
      ref.read(answerProvider.notifier).update((state) => option);
    }

    return IntrinsicWidth(
      child: Column(
        children: [
          if (selectedOption != '')
            AnswerFutureWidget(
              AnswerApi().postAnswer(
                  widget.topicId, widget.question.id, selectedOption),
              widget.topicId,
            ),
          const SizedBox(height: 20),
          ...[
            Text(
              widget.question.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 31, 21, 62)),
            ),
            const SizedBox(height: 20),
            if (widget.question.imageUrl != null)
              Image.network(widget.question.imageUrl!),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.question.options
                    .map((option) => OptionWidget(selectOption, option))
                    .toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
