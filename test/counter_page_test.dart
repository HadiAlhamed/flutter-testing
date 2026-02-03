import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/widgets/counter_page.dart';

void main() {
  testWidgets("Counter increment Press test", (
    WidgetTester widgetTester,
  ) async {
    await widgetTester.pumpWidget(MaterialApp(home: const CounterPage()));
    Finder initialCounterFinder = find.text("0");
    expect(initialCounterFinder, findsOneWidget);
    final Finder elevatedButtonFinder = find.byType(ElevatedButton);
    expect(elevatedButtonFinder, findsOneWidget);

    await widgetTester.tap(elevatedButtonFinder);
    await widgetTester.pumpAndSettle(); //rebuild the UI

    //pump and pumpAndSettle are like setState but when the ui needs to change with animation
    //it is better to use pumpAndSettle
    final Finder newCounterFinder = find.text("1");
    initialCounterFinder = find.text('0');
    expect(initialCounterFinder, findsNothing);
    expect(newCounterFinder, findsOneWidget);
  });
}
