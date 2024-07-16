import 'package:flutter/material.dart';
import 'package:project_1/routes/router.dart';

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
