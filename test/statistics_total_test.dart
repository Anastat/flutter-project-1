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

  testWidgets(
      'test SharedPreferences instance created and total correct answers count matches SharedPreferences',
      (tester) async {
    final statistics = await SharedPreferences.getInstance();
    expect(statistics, isA<SharedPreferences>());

    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(statistics),
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

    expect(find.text('Total correct answers: 0'), findsOneWidget);
  });
}
