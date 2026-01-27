import 'package:test/test.dart';
import 'package:testing/time_helper.dart';

void main() {
  group(
    "Test TimeHelper : TimeHelper.getTimeOfTheDay Morning , Afternoon, Evening, Night",
    () {},
  );
  test('Time Helper should return morning', () {
    final DateTime testTime = DateTime(2024, 1, 1, 6, 0, 0); // 6 AM
    final String result = TimeHelper.getTimeOfTheDay(datetime: testTime);
    expect(result, "Morning");
  });
  test('Time Helper should return afternoon', () {
    final DateTime testTime = DateTime(2024, 1, 1, 15, 0, 0); // 3 PM
    final String result = TimeHelper.getTimeOfTheDay(datetime: testTime);
    expect(result, "Afternoon");
  });
  test('Time Helper should return evening', () {
    final DateTime testTime = DateTime(2024, 1, 1, 19, 0, 0); // 7 PM
    final String result = TimeHelper.getTimeOfTheDay(datetime: testTime);
    expect(result, "Evening");
  });
  test('Time Helper should return night', () {
    final DateTime testTime = DateTime(2024, 1, 1, 0, 0, 0); // 12 am
    final String result = TimeHelper.getTimeOfTheDay(datetime: testTime);
    expect(result, "Night");
  });
}
