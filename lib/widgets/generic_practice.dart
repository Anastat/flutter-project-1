import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_1/providers/is_generic_provider.dart';

import '../models/topic.dart';
import '../providers/selected_topic_provider.dart';
import '../providers/topic_provider.dart';

class GenericPractice extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref.watch(topicsProvider);

    if (topics.isEmpty) {
      return const Text("No topics.");
    } else {
      // Topic to practice with a less correct answers
      Topic topicToPractice =
          ref.read(topicsProvider.notifier).genericPracticeTopic;

      return Container(
          padding: const EdgeInsets.all(10),
          width: 250,
          child: ElevatedButton(
              onPressed: () {
                // Set generic practice TRUE
                ref
                    .watch(isGenericPracticeProvider.notifier)
                    .update((state) => true);
                // Update selected topic
                ref
                    .read(selectedTopicProvider.notifier)
                    .selectTopic(topicToPractice);

                context.go(topicToPractice.questionPath);
              },
              child: const Text("Generic practice")));
    }
  }
}
