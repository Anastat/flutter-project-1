import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:project_1/quiz_app.dart';
import 'package:project_1/screens/home_screen.dart';

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

  testWidgets("App shows HomeScreen at start.", (tester) async {
    final myApp = ProviderScope(child: MaterialApp(home: QuizApp()));
    await tester.pumpWidget(myApp);
    // Wait for the data
    await tester.pumpAndSettle();

    final homeScreenFinder = find.byType(HomeScreen);
    expect(homeScreenFinder, findsOneWidget);
  });

  testWidgets("HomeScreen has topics.", (tester) async {
    final myApp = ProviderScope(child: MaterialApp(home: QuizApp()));
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
