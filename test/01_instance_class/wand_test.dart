import 'package:test/test.dart';
import 'package:learn_dart_together/01_instance_class/wand.dart';

void main() {
  group('wand test - 반드시 3글자 이상이어야 한다.', () {
    final Wand wand = Wand(name: 'validName', power: 0.5);

    test('지팡이 이름이 3글자 미만일 때 예외가 발생한다', () {
      expect(() => wand.name = '금', throwsException);
      expect(() => wand.name = '금은', throwsException);
    });

    test('지팡이 이름이 3글자 이상일 때 예외가 발생하지 않는다', () {
      expect(() => wand.name = '금은동', returnsNormally);
      expect(() => wand.name = '금은동4', returnsNormally);
    });
  });

  group('wand test - 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.', () {
    final Wand wand = Wand(name: 'validName', power: 50.0);

    test('지팡이의 마력이 0.5 미만일 때 예외가 발생한다', () {
      expect(() => wand.power = 0.4, throwsException);
    });

    test('지팡이의 마력이 100.0 초과일 때 예외가 발생한다', () {
      expect(() => wand.power = 100.1, throwsException);
    });
  });
}
