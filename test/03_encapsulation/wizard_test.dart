import 'package:learn_dart_together/03_encapsulation/wand.dart';
import 'package:learn_dart_together/03_encapsulation/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('Wizard constructor test', () {
    test('마법사의 이름은 3문자 이상이어야함', () {
      expect(() => Wizard(name: "법사", hp: 10, mp: 10), throwsException);
      expect(() => Wizard(name: "마법사", hp: 10, mp: 10), returnsNormally);
      expect(() => Wizard(name: "법사법사", hp: 10, mp: 10), returnsNormally);
    });

    test('마법사의 hp가 음수일 때 0을 설정', () {
      final wizard1 = Wizard(name: '마법사', hp: -10, mp: 10);
      final wizard2 = Wizard(name: '마법사', hp: 10, mp: 10);

      expect((wizard1.hp, wizard2.hp), (0, 10));
    });

    test('마법사의 mp는 0 이상이어야함', () {
      expect(() => Wizard(name: "마법사", hp: 10, mp: -5), throwsException);
      expect(() => Wizard(name: "마법사", hp: 10, mp: 5), returnsNormally);
    });
  });

  group('Wizard setter test', () {
    test('마법사의 이름은 3문자 이상이어야함', () {
      Wizard wizard = Wizard(name: "마법사", hp: 10, mp: 10);

      expect(() => wizard.name = '법사', throwsException);
      expect(() => wizard.name = '법사법사', returnsNormally);
    });

    test('마법사의 hp가 음수일 때 0을 설정', () {
      Wizard wizard1 = Wizard(name: "마법사", hp: 10, mp: 10);
      Wizard wizard2 = Wizard(name: "마법사", hp: 10, mp: 10);

      wizard1.hp = -10;
      wizard2.hp = 20;

      expect((wizard1.hp, wizard2.hp), (0, 20));
    });

    test('마법사의 mp는 0 이상이어야함', () {
      Wizard wizard = Wizard(name: "마법사", hp: 10, mp: 10);

      expect(() => wizard.mp = -5, throwsException);
      expect(() => wizard.mp = 20, returnsNormally);
    });

    test('마법사의 지팡이는 null로 set할 수 없음', () {
      Wizard wizard = Wizard(name: "마법사", hp: 10, mp: 10);

      expect(() => wizard.wand = null, throwsException);
      expect(() => wizard.wand = Wand(name: "지팡이", power: 20), returnsNormally);
    });
  });
}
