import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/flavors.dart';
import 'package:money_manager/pages/my_home_page.dart';

void main() {
  group('MyHomePage Tests', () {
    setUp(() {
      F.appFlavor = Flavor.dev;
    });

    testWidgets('displays app title in AppBar', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      // Verify AppBar title is displayed
      expect(find.text(F.title), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('displays greeting message in body', (
      WidgetTester tester,
    ) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      // Verify greeting message is displayed
      expect(find.text('Hello ${F.title}'), findsOneWidget);
    });

    testWidgets('has correct widget structure', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      // Verify widget structure
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });
  });

  group('MyHomePage Flavor Tests', () {
    testWidgets('dev flavor displays correct title', (
      WidgetTester tester,
    ) async {
      // Set dev flavor BEFORE building widget
      F.appFlavor = Flavor.dev;
      final expectedTitle = F.title;

      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      // Verify the title that was set
      expect(find.text(expectedTitle), findsOneWidget);
      expect(find.text('Hello $expectedTitle'), findsOneWidget);
    });

    testWidgets('prod flavor displays correct title', (
      WidgetTester tester,
    ) async {
      // Set prod flavor BEFORE building widget
      F.appFlavor = Flavor.prod;
      final expectedTitle = F.title;

      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      // Verify the title that was set
      expect(find.text(expectedTitle), findsOneWidget);
      expect(find.text('Hello $expectedTitle'), findsOneWidget);
    });
  });

  group('Flavor Configuration Tests', () {
    test('dev flavor has correct name and title', () {
      F.appFlavor = Flavor.dev;
      expect(F.name, equals('dev'));
      expect(F.title, equals('Wealth Dev'));
    });

    test('prod flavor has correct name and title', () {
      F.appFlavor = Flavor.prod;
      expect(F.name, equals('prod'));
      expect(F.title, equals('Wealth Manager'));
    });

    test('dev and prod flavors have different titles', () {
      F.appFlavor = Flavor.dev;
      final devTitle = F.title;

      F.appFlavor = Flavor.prod;
      final prodTitle = F.title;

      expect(devTitle, isNot(equals(prodTitle)));
    });
  });
}
