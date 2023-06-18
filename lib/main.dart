import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './screens/home_screen.dart';

main() {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      /*GoRoute(
          path: '/products/:id',
          builder: (context, state) =>
              ProductScreen(int.parse(state.params['id']!))),*/
    ],
  );

  runApp(MaterialApp.router(routerConfig: router));
}