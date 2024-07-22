import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/topic.dart';

class StatisticNotifier extends StateNotifier<List<Topic>> {
  final SharedPreferences prefs;

  StatisticNotifier(this.prefs) : super([]);

  void _initialize() {
    if (!prefs.containsKey("statistics")) {
      return;
    }

    Iterable statistics = json.decode(prefs.getString("statistics")!);
    state = List<Topic>.from(statistics.map((t) => Topic.fromJson(t)));
  }

  void setInitialStatistics(List<Topic> topics) {
    if (state.isEmpty) {
      state = topics;
    }
  }

  void increaseCorrectAnswers(int topicId) {
    List<Topic> newState = [...state];

    for (int i = 0; i < newState.length; i++) {
      if (newState[i].id == topicId) {
        newState[i].correctAnswers++;
      }
    }

    state = newState;
  }

  int get totalCorrectAnswers {
    int count = 0;
    state.forEach((topic) {
      count += topic.correctAnswers;
    });

    return count;
  }

  Topic get genericPracticeTopic {
    List<Topic> sortedTopics = [...state]
      ..sort((a, b) => b.correctAnswers.compareTo(a.correctAnswers));
    return sortedTopics.last;
  }
}

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final statisticsProvider =
    StateNotifierProvider<StatisticNotifier, List<Topic>>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final sn = StatisticNotifier(prefs);
  sn._initialize();
  return sn;
});
