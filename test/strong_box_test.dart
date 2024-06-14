import 'package:learn_dart_together/08_generic/assingment.dart';
import 'package:test/test.dart';

void main() {
  KeyType.values.forEach((value) {
    test('${value.toString()}은 ${value.count}회 시도해야 열린다.', () {
      final box = StrongBox(value);
      final someThing = 'something';

      int count = 0;
      box.put(someThing);
      while (box.get() == null) {
        count += 1;
      }
      expect(count, value.count);
    });
  });
}
