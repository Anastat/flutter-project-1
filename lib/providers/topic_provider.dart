import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/services/topic_api.dart';

import '../models/topic.dart';

class TopicNotifier extends StateNotifier<List<Topic>> {
  final topicApi = TopicApi();
  TopicNotifier() : super([]);

  _initialize() async {
    state = await topicApi.getTopics();
  }

  updateCorrectAnswers(int topicId) {
    state = [...state];
    state = [
      for (final topic in state)
        if (topic.id == topicId)
          topic.copyWith(correctAnswers: topic.correctAnswers++)
        else
          topic,
    ];
  }
}

final topicsProvider = StateNotifierProvider<TopicNotifier, List<Topic>>((ref) {
  final tn = TopicNotifier();
  tn._initialize();
  return tn;
});
