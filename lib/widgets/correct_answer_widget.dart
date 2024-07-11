import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:project_1/providers/is_generic_provider.dart';
import 'package:project_1/providers/selected_topic_provider.dart';

import '../models/topic.dart';
import '../providers/answer_provider.dart';
import '../providers/topic_provider.dart';

class CorrectAnswerWidget extends ConsumerWidget {
  _navigateToNext(BuildContext ctx, WidgetRef ref) {
    // Cleare the state of answer.
    ref.watch(answerProvider.notifier).update((state) => '');

    // Wheather the generic practice
    final isGenericPractice = ref.watch(isGenericPracticeProvider);
    if (isGenericPractice) {
      // Update topic to practice
      Topic topicToPractice =
          ref.read(topicsProvider.notifier).genericPracticeTopic;
      ref.read(selectedTopicProvider.notifier).selectTopic(topicToPractice);
    }

    final selectedTopic = ref.watch(selectedTopicProvider);
    int? topicId = selectedTopic?.id;
    // Show the next question.
    if (topicId != null) {
      ctx.replace('/topics/$topicId/questions');
    }
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
