import 'package:flutter/material.dart';
import 'package:project_1/widgets/topic_list.dart';
import '../widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TopBar(
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: TopicList()),
    );
  }
}
