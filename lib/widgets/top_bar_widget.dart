import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  final Widget widget;
  const TopBarWidget(this.widget);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: widget,
    );
  }
}
