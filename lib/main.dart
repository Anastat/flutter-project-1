import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_1/screens/answer_screen.dart';
import './screens/home_screen.dart';
import './screens/question_screen.dart';

main() {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(
          path: '/topics/:id/questions',
          builder: (context, state) =>
              QuestionScreen(int.parse(state.params['id']!))),
      GoRoute(
          path: '/topics/:topicId/questions/:questionId/answers',
          builder: (context, state) {
            final String answer = state.queryParams['answer']!;
            final topicId = int.parse(state.params['topicId']!);
            final questionId = int.parse(state.params['questionId']!);
            return AnswerScreen(topicId, questionId, answer);
          }),
    ],
  );

  runApp(MaterialApp.router(routerConfig: router));
}
