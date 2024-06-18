import 'package:learn_dart_together/08_string/homework/strongbox_.dart';
import 'package:test/test.dart';

void main() {
  group('StrongBox 각 KeyType별 금고 잠금해제 횟수 테스트', () {
    test(
        'KeyType.padlock 일 때, get() 호출 1024회 전 까지는 null 리턴, 1024회 때는 사과를 리턴 해야 한다.',
        () {
      final stringBox = StrongBox<String>(keyType: KeyType.padlock);
      stringBox.put('사과');

      for (int i = 0; i < 1024; i++) {
        print(i);
        expect(stringBox.get(), isNull);
      }

      expect(stringBox.get(), '사과');
    });

    test(
        'KeyType.button 일 때, get() 호출 10000 전 까지는 null 리턴, 10000 때는 사과를 리턴 해야 한다.',
        () {
      final stringBox = StrongBox<String>(keyType: KeyType.button);
      stringBox.put('사과');

      for (int i = 0; i < 10000; i++) {
        print(i);
        expect(stringBox.get(), isNull);
      }

      expect(stringBox.get(), '사과');
    });

    test(
        'KeyType.dial 일 때, get() 호출 30000 전 까지는 null 리턴, 30000 때는 사과를 리턴 해야 한다.',
        () {
      final stringBox = StrongBox<String>(keyType: KeyType.dial);
      stringBox.put('사과');

      for (int i = 0; i < 30000; i++) {
        print(i);
        expect(stringBox.get(), isNull);
      }

      expect(stringBox.get(), '사과');
    });

    test(
        'KeyType.finger 일 때, get() 호출 1000000 전 까지는 null 리턴, 1000000 때는 사과를 리턴 해야 한다.',
        () {
      final stringBox = StrongBox<String>(keyType: KeyType.finger);
      stringBox.put('사과');

      for (int i = 0; i < 1000000; i++) {
        print(i);
        expect(stringBox.get(), isNull);
      }

      expect(stringBox.get(), '사과');
    });
  });
}
