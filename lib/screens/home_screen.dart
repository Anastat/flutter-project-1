import 'package:flutter/material.dart';
import 'package:project_1/widgets/generic_practise.dart';
import 'package:project_1/widgets/topic_list.dart';
import '../widgets/horizontal_divider.dart';
import '../widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        "You can select a topic or general practice to answer the questions.",
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
              GenericPractise()
            ],
          )),
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
