import 'package:flutter/material.dart';
import 'package:project_1/services/answer_service.dart';
import 'package:project_1/widgets/answer_future_widget.dart';
import '../widgets/top_bar_widget.dart';

import '../services/question_service.dart';

class AnswerScreen extends StatelessWidget {
  final Question question;
  final int topicId;
  final int questionId;
  final String answer;
  const AnswerScreen(this.question, this.topicId, this.questionId, this.answer);

  @override
  Widget build(BuildContext context) {
    final String questionPath = "/topics/$topicId/questions";
    final int questionId = question.id;
    return TopBarWidget(
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: AnswerFutureWidget(
              question,
              AnswerService().postAnswer(topicId, questionId, answer),
              questionPath)),
    );
  }
}
