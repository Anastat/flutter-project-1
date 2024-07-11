import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../models/topic.dart';
import '../providers/selected_topic_provider.dart';

class TopicWidget extends ConsumerWidget {
  final Topic topic;

  const TopicWidget(this.topic);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: 250,
        child: ElevatedButton(
            onPressed: () {
              ref.read(selectedTopicProvider.notifier).selectTopic(topic);
              context.go(topic.questionPath);
            },
            child: Text(topic.name)));
  }
}
