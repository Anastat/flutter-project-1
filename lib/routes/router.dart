import 'package:go_router/go_router.dart';
import 'package:project_1/screens/correct_answer_screen.dart';

import '../screens/home_screen.dart';
import '../screens/question_screen.dart';
import '../screens/statistics_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
        path: '/topics/:id/questions',
        builder: (context, state) =>
            QuestionScreen(int.parse(state.params['id']!))),
    GoRoute(
        path: '/statistics',
        builder: (context, state) => const StatisticsScreen()),
    GoRoute(
        path: '/topics/:id/questions/correct',
        builder: (context, state) =>
            CorrectAnswerScreen(int.parse(state.params['id']!))),
  ],
);
