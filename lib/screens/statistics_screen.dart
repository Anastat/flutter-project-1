// TODO: Implement statistics by topics page 

/*
The topic-specific statistics show the total number of correct answers per topic.
The topic-specific statistics are sorted so that the order of the topics is based 
  on the number of correct answers, where the topic with the highest correct answer count is listed first.
*/

import 'package:flutter/material.dart';
import 'package:project_1/widgets/statistics_by_topics.dart';
import '../widgets/top_bar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TopBar(
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: StatisticsByTopics()),
    );
  }
}