import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/question_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
        path: '/topics/:id/questions',
        builder: (context, state) =>
            QuestionScreen(int.parse(state.params['id']!))),
    /*GoRoute(
        path: '/statistic',
        builder: (context, state) {
          return null;
        }),*/
  ],
);
