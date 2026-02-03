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
    final Finder elevatedButtonFinder = find.byKey(Key("addValue"));

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
  testWidgets("Enter Text value", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(home: const CounterPage()));

    Finder resultFinder = find.text('2');
    final Finder calculateBtnFinder = find.byKey(Key("calculate"));
    final Finder textFieldFinder = find.byKey(Key("resultTextField"));
    expect(resultFinder, findsOneWidget);
    expect(calculateBtnFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
    num number = 5;
    await widgetTester.enterText(textFieldFinder, number.toString());
    await widgetTester.tap(calculateBtnFinder);
    await widgetTester.pumpAndSettle();
    resultFinder = find.text("25");
    expect(resultFinder, findsOneWidget);
  });
}
