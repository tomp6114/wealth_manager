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
    testWidgets('displays development flavor title',
     (WidgetTester tester) async {
      // Set development flavor
      F.appFlavor = Flavor.dev;

      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );

      // Verify development title
      expect(find.text('Money Manager DEV'), findsOneWidget);
      expect(find.text('Hello Money Manager DEV'), findsOneWidget);
    });

    testWidgets('displays production flavor title',
     (WidgetTester tester) async {
      // Set production flavor
      F.appFlavor = Flavor.prod;

      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );

      // Verify production title
      expect(find.text('Money Manager'), findsOneWidget);
      expect(find.text('Hello Money Manager'), findsOneWidget);
    });
  });
}
