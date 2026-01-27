import 'package:testing/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Test Counter start, increment and decrement', () {
    test("Counter should start at 0", () {
      Counter counter = Counter();
      expect(counter.value, 0);
    });
    test('Counter value should be incremented by one', () {
      Counter counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test("Counter value should be decremented by one", () {
      Counter counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
