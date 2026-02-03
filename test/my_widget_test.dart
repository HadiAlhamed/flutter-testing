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
}
