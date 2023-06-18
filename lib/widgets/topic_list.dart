import 'package:flutter/material.dart';
import 'package:project_1/services/topic_service.dart';
import 'package:project_1/widgets/topic_widget.dart';

class TopicList extends StatelessWidget {
  final Future<List<Topic>> topics;
  const TopicList(this.topics);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: topics,
        builder: (BuildContext context, AsyncSnapshot<List<Topic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading topics.");
          } else if (snapshot.hasError) {
            return Text("Error retrieving topics: ${snapshot.error}");
          } else if (!snapshot.hasData) {
            return const Text("No topics.");
          } else {
            List<Topic> topics = snapshot.data!;
            return IntrinsicWidth(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: topics.map((e) => TopicWidget(e)).toList(),
            ));
          }
        });
  }
}
