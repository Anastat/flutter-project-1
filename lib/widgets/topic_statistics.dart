import 'package:flutter/material.dart';

import '../models/topic.dart';

class TopicStatistics extends StatelessWidget {
  final Topic topic;

  const TopicStatistics(this.topic, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text('${topic.name}: ${topic.correctAnswers}'));
  }
}
