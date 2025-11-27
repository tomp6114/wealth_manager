import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/flavors.dart';
import 'package:money_manager/pages/my_home_page.dart';

void main() {
  group('MyHomePage Tests', () {
    // Initialize flavor before all tests
    setUpAll(() {
      F.appFlavor = Flavor.dev;
    });

    testWidgets('displays app title in AppBar', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );

      // Verify AppBar title is displayed
      expect(find.text(F.title), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('displays greeting message in body', 
    (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );

      // Verify greeting message is displayed
      expect(find.text('Hello ${F.title}'), findsOneWidget);
    });

    testWidgets('has correct widget structure', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );

      // Verify widget structure
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });
  });

  group('MyHomePage Flavor Tests', () {
    testWidgets('dev flavor displays correct title', 
    (WidgetTester tester) async {
      // Set dev flavor
      F.appFlavor = Flavor.dev;

      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );

      // Verify dev title
      expect(find.text('Wealth Dev'), findsOneWidget);
      expect(find.text('Hello Wealth Dev'), findsOneWidget);
    });

    testWidgets('prod flavor displays correct title', 
    (WidgetTester tester) async {
      // Set prod flavor
      F.appFlavor = Flavor.prod;

      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );

      // Verify prod title
      expect(find.text('Wealth Manager'), findsOneWidget);
      expect(find.text('Hello Wealth Manager'), findsOneWidget);
    });

    testWidgets('dev and prod flavors have different titles', 
    (WidgetTester tester) async {
      // Get titles for each flavor
      F.appFlavor = Flavor.dev;
      final devTitle = F.title;

      F.appFlavor = Flavor.prod;
      final prodTitle = F.title;

      // Verify that flavors have different titles
      expect(devTitle, equals('Wealth Dev'));
      expect(prodTitle, equals('Wealth Manager'));
      expect(devTitle == prodTitle, isFalse,
          reason: 'Dev and Prod should have different titles');
    });

    testWidgets('flavor name matches enum name', (WidgetTester tester) async {
      // Test dev flavor name
      F.appFlavor = Flavor.dev;
      expect(F.name, equals('dev'));

      // Test prod flavor name
      F.appFlavor = Flavor.prod;
      expect(F.name, equals('prod'));
    });
  });
}
