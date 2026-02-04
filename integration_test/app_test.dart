import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/main.dart';

void main() {
  testWidgets("tab on the floating action button , verify counter", (
    WidgetTester widgetTester,
  ) async {
    await widgetTester.pumpWidget(const MyApp());
    expect(find.text('0'), findsOneWidget);
    final Finder fabFinder = find.byKey(Key("fab_increment"));
    await widgetTester.tap(fabFinder);
    await widgetTester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
  });
}
