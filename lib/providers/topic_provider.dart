import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/services/topic_api.dart';

import '../models/topic.dart';

class TopicNotifier extends StateNotifier<List<Topic>> {
  final topicApi = TopicApi();
  TopicNotifier() : super([]);

  _initialize() async {
    state = await topicApi.getTopics();
  }

  updateCorrectAnswers(Topic topic) {
    topic.correctAnswers++;
    state = [...state];
  }
}

final topicsProvider = StateNotifierProvider<TopicNotifier, List<Topic>>((ref) {
  final tn = TopicNotifier();
  tn._initialize();
  return tn;
});

