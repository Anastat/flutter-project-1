import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/services/question_api.dart';
import 'package:project_1/widgets/question_future_widget.dart';
import '../providers/selected_topic_provider.dart';
import '../widgets/top_bar.dart';

class QuestionScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTopic = ref.watch(selectedTopicProvider);
    if (selectedTopic == null) {
      return TopBar(
        Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10),
            child: Text('Please select a topic first.')),
      );
    }

    return TopBar(
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: QuestionFutureWidget(
              QuestionApi().getQuestion(selectedTopic.id), selectedTopic.id)),
    );
  }
}
