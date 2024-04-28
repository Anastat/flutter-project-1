import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class CorrectAnswerWidget extends StatelessWidget {
  final String questionPath;

  const CorrectAnswerWidget(this.questionPath);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Column(children: [
      const SizedBox(height: 20),
      const Text("Correct! Well done!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.green)),
      const SizedBox(height: 20),
      Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () => context.go(questionPath),
                  child: const Text("Next question"))
            ],
          ))
    ]));
  }
}
