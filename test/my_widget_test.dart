import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/main.dart';

void main() {
  testWidgets("MyWidget has a title and message", (
    WidgetTester widgetTester,
  ) async {
    await widgetTester.pumpWidget(
      const MyWidget(title: "title", message: "message"),
    ); //renders the widget into the testing environment
    Finder titleFinder = find.text('title');
    Finder messageFinder = find.text('message');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets("Find Widget By Key", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MyWidget(title: "title", message: "message"));
    Finder appBarFinder = find.byKey(Key("appBar"));
    expect(appBarFinder, findsOneWidget);
  });
  testWidgets("Find Widget By Type", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      const MyWidget(title: "title", message: "message"),
    ); //renders the widget into the testing environment
    Finder centerFinder = find.byType(Center);
    expect(centerFinder, findsOneWidget);
  });

  testWidgets("Find Widget By Instance/Widget", (
    WidgetTester widgetTester,
  ) async {
    final Widget icon = Icon(Icons.alarm);
    await widgetTester.pumpWidget(
      MyWidget(title: "title", message: "message", icon: icon),
    ); //renders the widget into the testing environment
    Finder iconFinder = find.byWidget(icon);
    expect(iconFinder, findsOneWidget);
  });
}
