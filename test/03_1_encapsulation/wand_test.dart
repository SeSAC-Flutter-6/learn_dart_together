import 'package:learn_dart_together/03_1_encapsulation/constants/validation_constants.dart';
import 'package:test/test.dart';
import 'package:learn_dart_together/03_1_encapsulation/wand.dart';

void main() {
  group('Wand constructor test', () {
    test('1: 지팡이의 이름은 $minNameLength글자 이상이다', () {
      expect(() => Wand(name: '지팡', power: 50), throwsException);
      expect(() => Wand(name: '지팡이', power: 50), returnsNormally);
      expect(() => Wand(name: '지팡이1', power: 50), returnsNormally);
    });
    test('2: 지팡이의 마력은 $minWeaponPower이상, $maxWeaponPower 이하여야 한다', () {
      expect(() => Wand(name: '테스트지팡이', power: minWeaponPower - 0.01),
          throwsException);
      expect(
          () => Wand(name: '테스트지팡이', power: minWeaponPower), returnsNormally);
      expect(() => Wand(name: '테스트지팡이', power: minWeaponPower + 0.01),
          returnsNormally);
      expect(
          () => Wand(
              name: '테스트지팡이', power: (minWeaponPower + maxWeaponPower) / 2),
          returnsNormally);
      expect(() => Wand(name: '테스트지팡이', power: maxWeaponPower - 0.01),
          returnsNormally);
      expect(
          () => Wand(name: '테스트지팡이', power: maxWeaponPower), returnsNormally);
      expect(() => Wand(name: '테스트지팡이', power: maxWeaponPower + 0.01),
          throwsException);
    });
  });

  group('Wand getter setter test', () {
    late Wand testWand;
    setUpAll(() {
      testWand = Wand(name: '테스트지팡이', power: 50);
    });
    test('1: 지팡이의 이름은 $minNameLength글자 이상이다', () {
      expect(() => testWand.name = '지팡', throwsException);
      expect(() => testWand.name = '지팡이', returnsNormally);
      expect(() => testWand.name = '지팡이1', returnsNormally);
    });
    test('2: 지팡이의 마력은 $minWeaponPower이상, $maxWeaponPower 이하여야 한다', () {
      expect(() => testWand.power = minWeaponPower - 0.01, throwsException);
      expect(() => testWand.power = minWeaponPower, returnsNormally);
      expect(() => testWand.power = minWeaponPower + 0.01, returnsNormally);
      expect(() => testWand.power = (minWeaponPower + maxWeaponPower) / 2,
          returnsNormally);
      expect(() => testWand.power = maxWeaponPower - 0.01, returnsNormally);
      expect(() => testWand.power = maxWeaponPower, returnsNormally);
      expect(() => testWand.power = maxWeaponPower + 0.01, throwsException);
    });
  });
}
