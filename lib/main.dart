import 'package:flutter/material.dart';
import 'package:project_1/providers/statistics_provider.dart';
import 'package:project_1/quiz_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: QuizApp(),
    ),
  );
}
