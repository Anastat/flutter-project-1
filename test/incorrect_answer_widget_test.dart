import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:project_1/providers/statistics_provider.dart';
import 'package:project_1/quiz_app.dart';
import 'package:project_1/routes/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock_api.dart';
import 'mock_shared.dart';

void main() {
  setUpAll(() {
    setupNock();
    TestWidgetsFlutterBinding.ensureInitialized();
    setupMockSharedPreferences();
  });

  setUp(() {
    nock.cleanAll();
    setupNock();
  });

  tearDown(() {
    nock.cleanAll();
  });

  testWidgets(
      "App displays feedback screen about incorrect answer and options.",
        (tester) async {
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

    await tester.tap(find.text('Basic arithmetics'));

    await tester.pumpAndSettle();
    // Question screen has question
    expect(find.text('What is the outcome of 50 + 50?'), findsOneWidget);

    await tester.tap(find.text('20'));
    // Wait for the answer
    await tester.pumpAndSettle();
    // Incorrect answer
    expect(find.text('Incorrect answer! Try again!'), findsOneWidget);

    expect(find.text('100'), findsOneWidget);
    expect(find.text('20'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('200'), findsOneWidget);
  });
}
