import 'package:learn_dart_together/01_instance_class/wand.dart';
import 'package:learn_dart_together/01_instance_class/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('wizard test - 반드시 3글자 이상이어야 한다.', () {
    final Wand wand = Wand(name: 'Wand', power: 50.0);
    final Wizard wizard = Wizard(name: 'Wiz', hp: 50, mp: 50, wand: wand);

    test('이름이 3글자 미만인 경우 예외를 던져야 한다.', () {
      expect(() => wizard.name = '금', throwsException);
      expect(() => wizard.name = '금은', throwsException);
    });

    test('이름이 3글자 이상인 경우 예외를 던지지 않아야 한다.', () {
      expect(() => wizard.name = '금은동', returnsNormally);
      expect(() => wizard.name = '금은동4', returnsNormally);
    });

    test('HP가 음수가 되는 경우 0으로 설정되어야 한다.', () {
      expect(() => wizard.hp = -10, throwsException);
      expect(() => wizard.hp = -100, throwsException);
    });

    test('HP가 음수가 되는 경우 0으로 설정되어야 한다.', () {
      expect(() => wizard.hp = 120, returnsNormally);
      expect(() => wizard.hp = 40, returnsNormally);
    });

    test('마법사의 MP는 0 이상이어야 한다.', () {
      expect(() => wizard.mp = -10, throwsException);
      expect(() => wizard.mp = -130, throwsException);
    });

    test('마법사의 MP는 0 이상이어야 한다.', () {
      expect(() => wizard.mp = 20, returnsNormally);
      expect(() => wizard.mp = 3, returnsNormally);
    });
  });
}
