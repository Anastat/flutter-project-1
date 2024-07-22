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
}

final topicsProvider = StateNotifierProvider<TopicNotifier, List<Topic>>((ref) {
  return TopicNotifier();
});
