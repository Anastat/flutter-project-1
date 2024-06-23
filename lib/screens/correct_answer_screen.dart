import 'package:flutter/material.dart';
import 'package:project_1/widgets/correct_answer_widget.dart';
import '../widgets/top_bar.dart';

class CorrectAnswerScreen extends StatelessWidget {
  final int topicId;
  const CorrectAnswerScreen(this.topicId, {super.key});

  @override
  Widget build(BuildContext context) {
    return TopBar(
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: CorrectAnswerWidget(topicId)),
    );
  }
}
