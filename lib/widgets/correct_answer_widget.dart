import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../providers/answer_provider.dart';

class CorrectAnswerWidget extends ConsumerWidget {
  final int topicId;

  const CorrectAnswerWidget(this.topicId);

  _navigateToNext(BuildContext ctx, WidgetRef ref) {
    // Cleare the state of answer.
    ref.watch(answerProvider.notifier).update((state) => '');
    // Show the next question.
    ctx.replace('/topics/$topicId/questions');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntrinsicWidth(
        child: Column(children: [
      const SizedBox(height: 20),
      const Text("Correct! Well done!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.green)),
      const SizedBox(height: 20),
      Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () => _navigateToNext(context, ref),
                  child: const Text("Next question"))
            ],
          ))
    ]));
  }
}
