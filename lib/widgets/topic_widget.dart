import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../models/topic.dart';

class TopicWidget extends StatelessWidget {
  final Topic topic;

  const TopicWidget(this.topic);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () => context.go(topic.questionPath),
            child: Text(topic.name)));
  }
}
