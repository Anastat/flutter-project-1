import 'package:flutter/material.dart';
import 'package:project_1/routes/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

main() async {
  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(prefs),
  ], child: MaterialApp.router(routerConfig: router)));
}
