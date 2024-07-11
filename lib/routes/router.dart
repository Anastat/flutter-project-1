import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_1/providers/answer_provider.dart';
import 'package:project_1/screens/correct_answer_screen.dart';

import '../providers/is_generic_provider.dart';
import '../providers/selected_topic_provider.dart';
import '../screens/home_screen.dart';
import '../screens/question_screen.dart';
import '../screens/statistics_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final container = ProviderScope.containerOf(context);
        // Clear saved values
        Future.microtask(() {
          container.read(answerProvider.notifier).state = '';
          container.read(isGenericPracticeProvider.notifier).state = false;
          container.read(selectedTopicProvider.notifier).clearSelection();
        });

        return HomeScreen();
      },
    ),
    GoRoute(
        path: '/topics/:id/questions',
        builder: (context, state) => QuestionScreen()),
    GoRoute(
        path: '/statistics',
        builder: (context, state) => const StatisticsScreen()),
    GoRoute(
        path: '/topics/:id/questions/correct',
        builder: (context, state) => CorrectAnswerScreen()),
  ],
);
