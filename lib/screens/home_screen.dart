import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/models/topic.dart';
import 'package:project_1/providers/statistics_provider.dart';
import 'package:project_1/providers/topic_provider.dart';
import 'package:project_1/widgets/generic_practice.dart';
import 'package:project_1/widgets/topic_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/horizontal_divider.dart';
import '../widgets/top_bar.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<List<Topic>>(topicsProvider, (previous, next) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (next.isNotEmpty && !prefs.containsKey("statistics")) {
        ref.read(statisticsProvider.notifier).setInitialStatistics(next);
      }
    });
    return TopBar(
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width *
                      0.7, // Takes 70% of screen width
                  child: const Column(children: [
                    Text(
                        "You can select a topic or generic practice to answer the questions.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 4, 113, 203),
                        )),
                    SizedBox(height: 10),
                    Text(
                        "Each question contains several answer options from which you have to choose the one.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 1, 49, 88),
                        )),
                  ])),
              TopicList(),
              Container(
                padding: EdgeInsets.all(20.0),
                width: 250, // Takes 70% of screen width
                child: HorizontalDivider(),
              ),
              GenericPractice()
            ],
          )),
    );
  }
}
