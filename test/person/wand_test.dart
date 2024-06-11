import 'package:learn_dart_together/03_encapsulation/wand.dart';
import 'package:test/test.dart';

void main() {
  final int minNameLenth = 3;
  final double minPower = 0.5;
  final double maxPower = 100;

  group('constructor()', () {
    test('wand의 이름은 3글자 이상이어야 한다.', () {
      Wand wand = Wand(name: '지팡이', power: minPower);
      expect(wand.name.length, greaterThanOrEqualTo(minNameLenth));
      expect(wand.name, isNotNull);
      expect(() => Wand(name: '뇽냥', power: minPower), throwsException);
      expect(() => wand.name = '냥뇽', throwsException);
    });

    test('wand의 power는 0.5 이상 100 이하여야 한다.', () {
      Wand wand = Wand(name: '지팡이', power: maxPower);
      expect(wand.power, inInclusiveRange(minPower, maxPower));
      expect(() => Wand(name: '지팡이', power: minPower - 1), throwsException);
      expect(() => Wand(name: '지팡이', power: maxPower + 1), throwsException);
      expect(() => wand.power = minPower - 1, throwsException);
      expect(() => wand.power = maxPower + 1, throwsException);
    });
  });
}
