import 'package:learn_dart_together/03_encapsulation/wand.dart';
import 'package:test/test.dart';

void main() {
  group('Wand constructor test', () {
    test('지팡이의 이름은 3문자 이상이어야함', () {
      expect(() => Wand(name: '지팡', power: 70), throwsException);
      expect(() => Wand(name: '지팡이', power: 70), returnsNormally);
      expect(() => Wand(name: '지팡지팡', power: 70), returnsNormally);
    });

    test('지팡이의 마력은 0.5 이상 100.0 이하여야함', () {
      expect(() => Wand(name: '지팡이', power: 0.3), throwsException);
      expect(() => Wand(name: '지팡이', power: 0.7), returnsNormally);
      expect(() => Wand(name: '지팡이', power: 120), throwsException);
    });
  });

  group('Wand setter test', () {
    test('지팡이의 이름은 3문자 이상이어야함', () {
      Wand wand = Wand(name: '지팡이', power: 70);

      expect(() => wand.name = '지팡', throwsException);
      expect(() => wand.name = '지팡지팡', returnsNormally);
    });

    test('지팡이의 마력은 0.5 이상 100.0 이하여야함', () {
      Wand wand = Wand(name: '지팡이', power: 70);

      expect(() => wand.power = 0.3, throwsException);
      expect(() => wand.power = 0.7, returnsNormally);
      expect(() => wand.power = 120, throwsException);
    });
  });
}
