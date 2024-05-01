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

/* 
TODO
Generic practice option

- In addition to the topics, the main page has an option for generic practice.
- When the generic practice option is selected, the user is always shown a question 
  from the topic for which the user has the fewest correct answers. 
  If there are multiple topics that have the same (fewest) correct answer count, the topic is selected from those at random.
- When a question in the generic practice option is answered correctly, the user is shown a button that allows them to see a new question.
- The new question is again picked from the topic with the fewest correct answers, taking the previous answer into account.

*/
