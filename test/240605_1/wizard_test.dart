import 'package:learn_dart_together/240605_1/wand.dart';
import 'package:test/test.dart';
import 'package:learn_dart_together/240605_1/wizard.dart';

void main() {
  group('wizard 생성자 테스트_', () {
    // 생성자
    test('wizard 생성자 실행시, 이름이 null이면 에러메세지 출력 ', () {
      expect(() => Wizard(name: null, hp: 100, mp: 50, wand: null),
          throwsException);
    });
    test('wizard 생성자 실행시, 이름이 3자 미만이면 에러메세지 출력 ', () {
      expect(
          () => Wizard(name: "", hp: 100, mp: 50, wand: null), throwsException);
      expect(() => Wizard(name: "이", hp: 100, mp: 50, wand: null),
          throwsException);
      expect(() => Wizard(name: "이름", hp: 100, mp: 50, wand: null),
          throwsException);
    });
    test('wizard 생성자 실행시, 이름이 3자 이상이면 정상 동작', () {
      expect(() => Wizard(name: "마법사이름", hp: 100, mp: 50, wand: null),
          isNot(throwsException));
    });
    // 마법사 hp 음수 일 때 에러메세지 출력
    // test('wizard 생성자 실행시, hp가 음수이면 에러메세지 출력', () {
    //   expect(() => Wizard(name: "마법사이름", hp: -1, mp: 50, wand: null),
    //       throwsException);
    // });
    test('wizard 생성자 실행시, hp가 음수이면 hp를 0으로 설정', () {
      Wizard wizard = Wizard(name: "마법사이름", hp: -1, mp: 50, wand: null);
      expect(wizard.hp, equals(0));

      Wizard wizard2 = Wizard(name: "마법사이름", hp: -99, mp: 50, wand: null);
      expect(wizard2.hp, equals(0));
    });
    test('wizard 생성자 실행시, mp가 음수이면 에러메세지 출력', () {
      expect(() => Wizard(name: "마법사이름", hp: 100, mp: -1, wand: null),
          throwsException);
      expect(() => Wizard(name: "마법사이름", hp: 100, mp: -99, wand: null),
          throwsException);
    });
  });
  group('wizard 수정 테스트_', () {
    test('wizard 이름 수정시, 이름이 null이면 에러메세지 출력', () {
      Wizard wizard = Wizard(name: "마법사이름", hp: 100, mp: 50, wand: null);
      expect(() => wizard.name = null, throwsException);
    });
    test('wizard 이름 수정시, 이름이 3자 미만이면 에러메세지 출력', () {
      Wizard wizard = Wizard(name: "마법사이름", hp: 100, mp: 50, wand: null);
      expect(() => wizard.name = "이름", throwsException);
      expect(() => wizard.name = "이", throwsException);
      expect(() => wizard.name = "", throwsException);
    });
    test('wizard 이름 수정시, 이름이 3자 이상이면 정상 동작', () {
      Wizard wizard = Wizard(name: "마법사", hp: 100, mp: 50, wand: null);
      expect(() => wizard.name = "마법사수정", isNot(throwsException));
    });
    test('wizard hp 수정시, hp가 음수이면 hp를 0으로 설정', () {
      Wizard wizard = Wizard(name: "마법사이름", hp: 100, mp: 50, wand: null);
      wizard.hp = -1;
      expect(wizard.hp, equals(0));

      Wizard wizard2 = Wizard(name: "마법사이름", hp: 100, mp: 50, wand: null);
      wizard2.hp = -99;
      expect(wizard2.hp, equals(0));
    });
    test('wizard mp 수정시, mp가 음수이면 에러메세지 출력', () {
      Wizard wizard = Wizard(name: "마법사이름", hp: 100, mp: 50, wand: null);
      expect(() => wizard.mp = -1, throwsException);

      Wizard wizard2 = Wizard(name: "마법사이름", hp: 100, mp: 50, wand: null);
      expect(() => wizard2.mp = -99, throwsException);
    });
    test('wizard 생성 이후 wand를 null로 수정시, 에러메세지 출력', () {
      Wizard wizard = Wizard(
          name: "마법사이름", hp: 100, mp: 50, wand: Wand(name: "나무무", power: 100));
      expect(() => wizard.wand = null, throwsException);
    });
  });
}
