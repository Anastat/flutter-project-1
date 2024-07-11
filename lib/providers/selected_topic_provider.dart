import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/topic.dart';

// A StateNotifier to manage the selected topic state
class SelectedTopicNotifier extends StateNotifier<Topic?> {
  SelectedTopicNotifier() : super(null);

  // Set the selected topic
  void selectTopic(Topic topic) {
    state = topic;
  }

  // Clear the selected topic
  void clearSelection() {
    state = null;
  }
}

final selectedTopicProvider =
    StateNotifierProvider<SelectedTopicNotifier, Topic?>((ref) {
  return SelectedTopicNotifier();
});
