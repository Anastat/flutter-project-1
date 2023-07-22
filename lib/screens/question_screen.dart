import 'package:flutter/material.dart';
import 'package:project_1/services/question_service.dart';
import 'package:project_1/widgets/question_widget.dart';
import '../widgets/top_bar_widget.dart';

class QuestionScreen extends StatelessWidget {
  final int topicId;
  const QuestionScreen(this.topicId);

  @override
  Widget build(BuildContext context) {
    return TopBarWidget(
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: QuestionWidget(QuestionService().getQuestion(topicId))),
    );
  }
}
