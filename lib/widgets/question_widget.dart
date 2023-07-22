import 'package:flutter/material.dart';
import 'package:project_1/widgets/option_widget.dart';

import '../services/question_service.dart';

class QuestionWidget extends StatelessWidget {
  final Future<Question> question;
  const QuestionWidget(this.question);

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
          return IntrinsicWidth(
              child: Column(
            children: [
              Text(question.question),
              if (question.imageUrl != null) Image.network(question.imageUrl!),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: question.options
                        .map((e) => OptionWidget(e, question.answerPostPath))
                        .toList(),
                  ))
            ],
          ));
        }
      },
    );
  }
}
