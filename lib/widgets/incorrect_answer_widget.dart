import 'package:flutter/material.dart';

class IncorrectAnswerWidget extends StatelessWidget {
  const IncorrectAnswerWidget();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: const Column(children: [
      SizedBox(height: 20),
      Text("Incorrect answer! Try again!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.red))
    ]));
  }
}
