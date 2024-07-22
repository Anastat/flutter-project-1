import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:project_1/providers/statistics_provider.dart';
import 'package:project_1/quiz_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mock_api.dart';
import 'mock_shared.dart';

Future<void> main() async {
  setUpAll(() async {
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

  testWidgets('test statistics page shows correct answers by topics',
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

    await tester.tap(find.text('Statistics'));

    await tester.pumpAndSettle();

    expect(find.text('Basic arithmetics: 0'), findsOneWidget);
    expect(find.text('Countries and capitals: 0'), findsOneWidget);
    expect(find.text('Countries and continents: 0'), findsOneWidget);
    expect(find.text('Dog breeds: 0'), findsOneWidget);
  });
}
