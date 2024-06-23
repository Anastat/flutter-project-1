import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  final Widget widget;
  const TopBar(this.widget);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Builder(builder: (BuildContext context) {
          return ElevatedButton(
            onPressed: () => context.go("/statistics"),
            child: const Text("Statistics"),
          );
        }),
        title: const Text("Quiz"),
      ),
      body: SingleChildScrollView(child: widget),
    );
  }
}
