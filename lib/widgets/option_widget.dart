import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final String option;
  final String postPath;

  const OptionWidget(this.option, this.postPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () => context.go(
                Uri(path: postPath, queryParameters: {'answer': option})
                    .toString()),
            child: Text(option)));
  }
}
