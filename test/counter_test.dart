import 'package:testing/counter.dart';
import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented by one', () {
    Counter counter = Counter();
    expect(counter.value, 0);
    counter.increment();
    expect(counter.value, 1);
  });

  test("Counter value should be decremented by one", () {
    Counter counter = Counter();
    expect(counter.value, 0);
    counter.decrement();
    expect(counter.value, -1);
  });
}
