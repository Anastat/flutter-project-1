/*
The topic-specific statistics show the total number of correct answers per topic.
The topic-specific statistics are sorted so that the order of the topics is based 
  on the number of correct answers, where the topic with the highest correct answer count is listed first.
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/providers/statistics_provider.dart';
import 'package:project_1/widgets/statistics_by_topics.dart';
import '../widgets/top_bar.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int totalCorrect = ref.read(statisticsProvider.notifier).totalCorrectAnswers;

    return TopBar(
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Total correct answers: $totalCorrect',
                      style: const TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 4, 113, 203),
                      ))),
              const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Number of correct answers by topics:',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 4, 113, 203),
                      ))),
              StatisticsByTopics()
            ],
          )),
    );
  }
}
