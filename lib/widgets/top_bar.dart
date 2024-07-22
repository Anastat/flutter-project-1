import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  final Widget widget;
  const TopBar(this.widget);

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).location;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Builder(builder: (BuildContext context) {
          if (currentRoute != "/") {
            return TextButton(
              onPressed: () => context.go("/"),
              child: const Text("Topics"),
            );
          } else
            return Container(); // Don't display topics
        }),
        title: const Text("Quiz"),
        actions: [
          if (currentRoute != "/statistics")
            TextButton(
              onPressed: () => context.go("/statistics"),
              child: const Text("Statistics"),
            )
        ],
      ),
      body: SingleChildScrollView(child: widget),
    );
  }
}
