import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final Widget widget;
  const TopBar(this.widget);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: SingleChildScrollView(child: widget),
    );
  }
}
