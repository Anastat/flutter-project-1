import 'package:flutter/material.dart';
import 'package:project_1/widgets/question_widget.dart';

import '../models/question.dart';

class QuestionFutureWidget extends StatelessWidget {
  final Future<Question> question;
  final int topicId;
  const QuestionFutureWidget(this.question, this.topicId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Question>(
      future: question,
      builder: (BuildContext context, AsyncSnapshot<Question> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading question.");
        } else if (snapshot.hasError) {
          return Text("Error retrieving question: ${snapshot.error}");
        } else if (!snapshot.hasData) {
          return const Text("No question data.");
        } else {
          Question question = snapshot.data!;
          return QuestionWidget(question, topicId);
        }
      },
    );
  }
}
