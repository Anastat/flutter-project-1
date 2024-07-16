import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:project_1/routes/router.dart';

import 'mock_data.dart';

void main() {
  setUpAll(() {
    setupNock();
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    nock.cleanAll();
    setupNock();
  });

  testWidgets("App displays feedback screen about correct answer.",
      (tester) async {
    final myApp = ProviderScope(
        child: MaterialApp.router(
      routerConfig: router,
    ));
    await tester.pumpWidget(myApp);

    await tester.pumpAndSettle();

    await tester.tap(find.text('Basic arithmetics'));

    await tester.pumpAndSettle();
    // Question screen has question
    expect(find.text('What is the outcome of 50 + 50?'), findsOneWidget);

    await tester.tap(find.text('100'));
    // Wait for the answer
    await tester.pumpAndSettle();
    // Incorrect answer
    expect(find.text('Correct! Well done!'), findsOneWidget);
  });
}
