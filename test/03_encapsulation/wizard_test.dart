import 'package:learn_dart_together/03_encapsulation/wand.dart';
import 'package:learn_dart_together/03_encapsulation/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('wizard 생성자 테스트', () {
    test('인스턴스 생성시 이름 3글자 미만이면 exception', () {
      expect(() => Wizard(name: '해리', mp: 50, hp: 50), throwsException);
    });
    test('인스턴스 생성시 mp 0 미만이면 exception', () {
      expect(() => Wizard(name: '마법사', mp: -5, hp: 50), throwsException);
    });
    test('인스턴스 생성시 hp가 음수면 0 설정', () {
      Wizard wizard = Wizard(name: '마법사', mp: 50, hp: -5);
      expect(wizard.hp == 0, true);
    });
  });
  group('Wizard 클래스 exception 테스트', () {
    test('wand가 null이면 exception', () {
      Wand wand = Wand(name: '지팡이', power: 50);
      Wizard wizard = Wizard(name: '마법사', mp: 50, hp: 50, wand: wand);
      expect(() => wizard.wand = null, throwsException);
    });
    test('mp가 0 미만이면 exception', () {
      Wizard wizard = Wizard(name: '마법사', mp: 50, hp: 50);
      expect(() => wizard.mp = -5, throwsException);
    });
  });
  test('hp가 0 미만이면 0 설정', () {
    Wizard wizard = Wizard(name: '마법사', mp: 50, hp: 50);
    wizard.hp = -10;
    expect(wizard.hp, 0);
  });
}
