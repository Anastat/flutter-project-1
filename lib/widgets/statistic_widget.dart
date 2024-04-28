import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder<int>(
        /*future: getLikes(),*/
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Text('Likes: ${snapshot.data}');
          }

          return const Text('Likes: ?');
        },
      ),
      IconButton(
        icon: const Icon(Icons.thumb_up),
        onPressed: null, // () => incrementLikes(),
      ),
    ]);
  }
}

Future<int> getCorrect(topicName) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(topicName)) {
    return prefs.getInt(topicName)!;
  }

  return 0;
}

incrementCorrect(topicName) async {
  final correctAnswers = await getCorrect(topicName);
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(topicName, correctAnswers + 1);
}
