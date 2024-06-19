import 'package:learn_dart_together/08_generic_enum_string/strong_box.dart';
import 'package:test/test.dart';

void main() {
  group('StrongBox test', () {
    final sb = StrongBox<String>(key: KeyType.test);

    test('put() 메서드로 물건을 보관할 수 있음, 이미 보관중인 경우 Exception 발생', () {
      sb.put('Gold');
      expect(sb.valuables, 'Gold');
      expect(() => sb.put('Silver'), throwsException);
    });

    test('get() 메서드 실행시 시도횟수에 도달하면 물건 반환', () {
      expect(sb.get(), null);
      expect(sb.get(), null);
      expect(sb.get(), 'Gold');
    });
  });
}
