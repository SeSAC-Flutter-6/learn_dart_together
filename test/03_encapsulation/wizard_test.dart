import 'package:learn_dart_together/03_encapsulation/wand.dart';
import 'package:learn_dart_together/03_encapsulation/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late Wand wand;

  setUpAll(() {
    wand = Wand(name: '겁나 강력한 지팡이', power: 100);
  });
  group('마법사 행동 4원칙', () {
    test('1. 마법사의 이름은 3글자 이상이어야 한다.', () {
      expect(() => Wizard(name: '', hp: 50, mp: 10, wand: wand), throwsException);
      expect(() => Wizard(name: '아', hp: 50, mp: 10, wand: wand), throwsException);
      expect(() => Wizard(name: '아아', hp: 50, mp: 10, wand: wand), throwsException);
      expect(() => Wizard(name: '아아아', hp: 50, mp: 10, wand: wand), returnsNormally);
    });

    test('2. 마법사는 지팡이를 내려놓을 수 없다.', () {
      final Wizard wizard = Wizard(name: '아아아', hp: 50, mp: 0, wand: wand);
      expect(() => wizard.wand = null, throwsException);
    });

    test('3. 마법사의 MP는 0보다 작을 수 없다.', () {
      expect(() => Wizard(name: '아아아', hp: 50, mp: -1, wand: wand), throwsException);
      expect(() => Wizard(name: '아아아', hp: 50, mp: 0, wand: wand), returnsNormally);

      final Wizard wizard = Wizard(name: '아아아', hp: 50, mp: 0, wand: wand);
      expect(() => wizard.mp = -1, throwsException);
    });

    test('4. 마법사의 HP는 0보다 작을 수 없다.', () {
      Wizard wizard = Wizard(name: '아아아', hp: -1, mp: 0, wand: wand);
      expect(wizard.hp, greaterThanOrEqualTo(0));
      wizard.hp = -99;
      expect(wizard.hp, greaterThanOrEqualTo(0));
    });
  });
}