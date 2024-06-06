import 'package:test/test.dart';
import 'package:learn_dart_together/240605_1/wand.dart';

void main() {
  group('wand 생성자 테스트_', () {
    test('wand 생성자 실행시, 이름이 null이면 에러메세지 출력', () {
      expect(() => Wand(name: null, power: 10), throwsException);
    });
    test('wand 생성자 실행시, 이름이 3자 미만이면 에러메세지 출력', () {
      expect(() => Wand(name: "", power: 10), throwsException);
      expect(() => Wand(name: "이", power: 10), throwsException);
      expect(() => Wand(name: "이이", power: 10), throwsException);
    });
    test('wand 생성자 실행시, 이름이 3자 이상이면 정상 동작', () {
      expect(() => Wand(name: "마법지팡이", power: 10), returnsNormally);
    });
    test('wand 생성자 실행시, 마력이 100 초과이면 에러메세지 출력', () {
      expect(() => Wand(name: "마법지팡이", power: 100.1), throwsException);
      expect(() => Wand(name: "마법지팡이", power: 200), throwsException);
    });
    test('wand 생성자 실행시, 마력이 0.5 미만이면 에러메세지 출력', () {
      expect(() => Wand(name: "마법지팡이", power: 0.4), throwsException);
    });
  });
  group('wand 수정 테스트_', () {
    test('wand 이름 수정시, 이름이 null이면 에러메세지 출력', () {
      Wand wand = Wand(name: "마법지팡이", power: 10);
      expect(() => wand.name = null, throwsException);
    });
    test('wand 이름 수정시, 이름이 3자 미만이면 에러메세지 출력', () {
      Wand wand = Wand(name: "마법지팡이", power: 10);
      expect(() => wand.name = "마법", throwsException);
      expect(() => wand.name = "마", throwsException);
      expect(() => wand.name = "", throwsException);
    });
    test('wand 마력 수정시, 마력이 0.5 미만이면 에러메세지 출력', () {
      Wand wand = Wand(name: "마법지팡이", power: 10);
      expect(() => wand.power = 0.4, throwsException);
    });

    test('wand 마력 수정시, 마력이 100 초과이면 에러메세지 출력', () {
      Wand wand = Wand(name: "마법지팡이", power: 10);
      expect(() => wand.power = 100.1, throwsException);
      expect(() => wand.power = 200, throwsException);
    });
  });
}
