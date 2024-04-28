import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/widgets/topic_widget.dart';

import '../providers/topic_provider.dart';

class TopicList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref.watch(topicsProvider);

    if (topics.isEmpty) {
      return const Text("No topics.");
    } else {
      return IntrinsicWidth(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: topics.map((e) => TopicWidget(e)).toList(),
      ));
    }
  }
}
