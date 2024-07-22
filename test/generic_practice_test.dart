import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:project_1/models/topic.dart';
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

  testWidgets(
      "Generic practice shows a question from a topic with the fewest correct answers",
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

    await tester.ensureVisible(find.text('Generic practice'));
    await tester.tap(find.text('Generic practice'));

    Topic genericPracticeTopic =
        container.read(statisticsProvider.notifier).genericPracticeTopic;

    await tester.pumpAndSettle();

    if (genericPracticeTopic.id == 1) {
      expect(find.text('What is the outcome of 50 + 50?'), findsOneWidget);
    } else if (genericPracticeTopic.id == 2) {
      expect(find.text('What is the capital of Afghanistan?'), findsOneWidget);
    } else if (genericPracticeTopic.id == 3) {
      expect(
          find.text('In what continent is Argentina located?'), findsOneWidget);
    } else if (genericPracticeTopic.id == 4) {
      expect(find.text('What sort of a dog is this?'), findsOneWidget);
    }
  });
}
