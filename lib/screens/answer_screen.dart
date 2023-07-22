import 'package:flutter/material.dart';
import 'package:project_1/services/answer_service.dart';
import 'package:project_1/widgets/answer_widget.dart';
import '../widgets/top_bar_widget.dart';

class AnswerScreen extends StatelessWidget {
  final int topicId;
  final int questionId;
  final String answer;
  const AnswerScreen(this.topicId, this.questionId, this.answer);

  @override
  Widget build(BuildContext context) {
    return TopBarWidget(
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: AnswerWidget(
              AnswerService().postAnswer(topicId, questionId, answer))),
    );
  }
}
