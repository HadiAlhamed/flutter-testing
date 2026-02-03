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
    final Finder titleFinder = find.text('title');
    final Finder messageFinder = find.text('message');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets("Find Widget By Key", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MyWidget(title: "title", message: "message"));
    final Finder appBarFinder = find.byKey(Key("appBar"));
    expect(appBarFinder, findsOneWidget);
  });
  testWidgets("Find Widget By Type", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      const MyWidget(title: "title", message: "message"),
    ); //renders the widget into the testing environment
    final Finder centerFinder = find.byType(Center);
    expect(centerFinder, findsOneWidget);
  });

  testWidgets("Find Widget By Instance/Widget", (
    WidgetTester widgetTester,
  ) async {
    final Widget icon = Icon(Icons.alarm);
    await widgetTester.pumpWidget(
      MyWidget(title: "title", message: "message", icon: icon),
    ); //renders the widget into the testing environment
    final Finder iconFinder = find.byWidget(icon);
    expect(iconFinder, findsOneWidget);
  });

  //suppose we want to check whether something is present in the subtree of a widget
  testWidgets("Find AppBar with title", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MyWidget(title: "title", message: "message"));
    final Finder appBarFinder = find.byKey(Key("appBar"));
    expect(appBarFinder, findsOneWidget);
    final appBarHasTitle = find.descendant(
      of: appBarFinder,
      matching: find.text('title'),
    );
    expect(appBarHasTitle, findsOneWidget);
  });
}
