import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:project_1/providers/statistics_provider.dart';
import 'package:project_1/quiz_app.dart';
import 'package:project_1/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock_api.dart';
import 'mock_shared.dart';

void main() {
  setUpAll(() async {
    setupNock();
    TestWidgetsFlutterBinding.ensureInitialized();
    setupMockSharedPreferences();
  });

  setUp(() {
    nock.cleanAll();
    setupNock();
  });

  testWidgets("App shows HomeScreen at start.", (tester) async {
    final prefs = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
    );

    final myApp = UncontrolledProviderScope(
      container: container,
      child: MaterialApp(home: QuizApp()),
    );

    await tester.pumpWidget(myApp);
    await tester.pumpAndSettle();

    final homeScreenFinder = find.byType(HomeScreen);
    expect(homeScreenFinder, findsOneWidget);
  });

  testWidgets("HomeScreen has topics.", (tester) async {
    final prefs = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
    );

    final myApp = UncontrolledProviderScope(
      container: container,
      child: MaterialApp(home: QuizApp()),
    );

    await tester.pumpWidget(myApp);
    await tester.pumpAndSettle();

    final description = find.text(
        'You can select a topic or generic practice to answer the questions.');
    expect(description, findsOneWidget);

    expect(find.text('Basic arithmetics'), findsOneWidget);
    expect(find.text('Countries and capitals'), findsOneWidget);
    expect(find.text('Countries and continents'), findsOneWidget);
    expect(find.text('Dog breeds'), findsOneWidget);
  });
}
