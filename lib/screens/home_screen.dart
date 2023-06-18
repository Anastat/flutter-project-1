import 'package:flutter/material.dart';
import 'package:project_1/services/topic_service.dart';
import 'package:project_1/widgets/topic_list.dart';
import '../widgets/top_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TopBarWidget(
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: TopicList(TopicsService().getTopics())),
    );
  }
}
