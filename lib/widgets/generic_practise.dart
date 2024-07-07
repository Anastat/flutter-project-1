import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/topic.dart';
import '../providers/selected_topic_provider copy.dart';
import '../providers/topic_provider.dart';

class GenericPractise extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref.watch(topicsProvider);
    final sortedTopics = [...topics]
      ..sort((a, b) => b.correctAnswers.compareTo(a.correctAnswers));

    if (sortedTopics.isEmpty) {
      return const Text("No topics.");
    } else {
      // Last element with a less correct answers
      Topic topicToPractise = sortedTopics.last;

      return Container(
          padding: const EdgeInsets.all(10),
          width: 250,
          child: ElevatedButton(
              onPressed: () {
                ref
                    .read(selectedTopicProvider.notifier)
                    .selectTopic(topicToPractise);
                context.go(topicToPractise.questionPath);
              },
              child: const Text("Generic practise")));
    }
  }
}
