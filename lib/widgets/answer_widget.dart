import 'package:flutter/material.dart';

import '../services/answer_service.dart';

class AnswerWidget extends StatelessWidget {
  final Future<bool> answer;
  const AnswerWidget(this.answer);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: answer,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Verifying your answer.");
        } else if (snapshot.hasError) {
          return Text("Error verifying answer: ${snapshot.error}");
        } else if (!snapshot.hasData) {
          return const Text("No answer.");
        } else {
          bool answer = snapshot.data!;
          return IntrinsicWidth(
              child: Column(
            children: [
              Text(answer.toString()),
            ],
          ));
        }
      },
    );
  }
}
