import 'package:learn_dart_together/03_1_encapsulation/constants/validation_constants.dart';
import 'package:test/test.dart';
import 'package:learn_dart_together/03_1_encapsulation/wizard.dart';
import 'package:learn_dart_together/03_1_encapsulation/wand.dart';

void main() {
  Wand testWand = Wand(name: '테스트용지팡이', power: 30);
  group('Wizard constructor test', () {
    test('1: 마법사의 이름은 $minNameLength글자 이상이다', () {
      expect(() => Wizard(name: '마법', hp: 100, mp: 100, wand: testWand),
          throwsException);
      expect(() => Wizard(name: '마법사', hp: 100, mp: 100, wand: testWand),
          returnsNormally);
      expect(() => Wizard(name: '마법사1', hp: 100, mp: 100, wand: testWand),
          returnsNormally);
    });
    test('2: 마법사의 지팡이는 null일 수 없다', () {
      expect(() => Wizard(name: '마법사', hp: 100, mp: 100), throwsException);
      expect(() => Wizard(name: '마법사', hp: 100, mp: 100, wand: null),
          throwsException);
    });
    test('3: 마법사의 MP는 $minMP이상이어야 한다', () {
      expect(() => Wizard(name: '마법사', hp: 100, mp: minMP - 1, wand: testWand),
          throwsException);
      expect(() => Wizard(name: '마법사', hp: 100, mp: minMP, wand: testWand),
          returnsNormally);
      expect(() => Wizard(name: '마법사', hp: 100, mp: minMP + 1, wand: testWand),
          returnsNormally);
    });
    test('4: 마법사의 HP가 음수라면 $minHP으로 설정한다', () {
      Wizard wz1 = Wizard(name: '마법사', hp: -1, mp: 10, wand: testWand);
      Wizard wz2 = Wizard(name: '마법사', hp: 0, mp: 10, wand: testWand);
      Wizard wz3 = Wizard(name: '마법사', hp: 1, mp: 10, wand: testWand);
      expect([wz1.hp, wz2.hp, wz3.hp], equals([minHP, 0, 1]));
    });
  });

  group('Wizard getter setter test', () {
    late Wizard testWizard;
    setUp(() {
      testWizard = Wizard(name: '테스트마법사', hp: 10, mp: 10, wand: testWand);
    });
    test('1: 마법사의 이름은 $minNameLength글자 이상이다', () {
      expect(() => testWizard.name = '마법', throwsException);
      expect(() => testWizard.name = '테스트', returnsNormally);
      expect(() => testWizard.name = '테스트마법사', returnsNormally);
    });
    test('2: 마법사의 지팡이는 null일 수 없다', () {
      expect(() => testWizard.wand = null, throwsException);
    });
    test('3: 마법사의 MP는 $minMP이상이어야 한다', () {
      expect(() => testWizard.mp = minMP - 1, throwsException);
      expect(() => testWizard.mp = minMP, returnsNormally);
      expect(() => testWizard.mp = minMP + 1, returnsNormally);
    });
    test('4: 마법사의 HP가 음수라면 $minHP으로 설정한다', () {
      testWizard.hp = -1;
      expect(testWizard.hp, equals(minHP));

      testWizard.hp = 0;
      expect(testWizard.hp, equals(0));

      testWizard.hp = 1;
      expect(testWizard.hp, equals(1));
    });
  });
}
