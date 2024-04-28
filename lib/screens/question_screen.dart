import 'package:flutter/material.dart';
import 'package:project_1/services/question_api.dart';
import 'package:project_1/widgets/question_future_widget.dart';
import '../widgets/top_bar.dart';

class QuestionScreen extends StatelessWidget {
  final int topicId;
  const QuestionScreen(this.topicId);

  @override
  Widget build(BuildContext context) {
    return TopBar(
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: QuestionFutureWidget(QuestionApi().getQuestion(topicId))),
    );
  }
}
