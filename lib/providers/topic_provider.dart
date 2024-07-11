import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/services/topic_api.dart';

import '../models/topic.dart';

class TopicNotifier extends StateNotifier<List<Topic>> {
  final topicApi = TopicApi();

  TopicNotifier() : super([]) {
    _initialize();
  }

  void _initialize() async {
    var topics = await topicApi.getTopics();
    state = topics;
  }

  void increaseCorrectAnswers(int topicId) {
    // Make a shallow copy of the state
    List<Topic> newState = [...state];

    for (int i = 0; i < newState.length; i++) {
      if (newState[i].id == topicId) {
        newState[i].correctAnswers++;
      }
    }

    // Update the state with the new state
    state = newState;
  }

  Topic get genericPracticeTopic {
    List<Topic> sortedTopics = [...state]
      ..sort((a, b) => b.correctAnswers.compareTo(a.correctAnswers));
    return sortedTopics.last;
  }
}

final topicsProvider = StateNotifierProvider<TopicNotifier, List<Topic>>((ref) {
  return TopicNotifier();
});
