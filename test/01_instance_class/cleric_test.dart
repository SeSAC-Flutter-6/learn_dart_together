import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';

void main() {
  late Cleric cleric;

  group('Cleric 클래스 test', () {
    setUpAll(() {
      cleric = Cleric(name: '기본성직자');
    });

    test('기본성직자 초기 상태 확인', () {
      expect([cleric.hp, cleric.mp], equals([50, 10]));
    });

    test('selfAid() test1: 사용 시 5 차감, hp max회복 확인', () {
      //test를 위해 hp를 30으로 설정
      cleric.mp = cleric.maxMp;
      cleric.hp = 30;
      cleric.selfAid();
      expect([cleric.hp, cleric.mp], equals([cleric.maxHp, 5]));
    });

    test('selfAid() test2: mp가 5 미만일 때 아무런 효과 없음', () {
      //test를 위해 mp를 2로 설정
      cleric.mp = 2;
      cleric.selfAid();
      expect([cleric.hp, cleric.mp], equals([cleric.hp, cleric.mp]));
    });

    test('pray() test1: 현재 mp ==2, 3초 기도 시 3~5만큼의 mp 회복', () {
      cleric.mp = 2;
      int praySeconds = 3;
      int prayResult = cleric.pray(praySeconds: praySeconds);

      expect(
          [prayResult, prayResult],
          equals([
            greaterThanOrEqualTo(praySeconds),
            lessThanOrEqualTo(praySeconds + 2)
          ]));
    });

    test('pray() test2: 0초 기도 시 회복량 0', () {
      int praySeconds = 0;
      int prayResult = cleric.pray(praySeconds: praySeconds);

      expect([prayResult, cleric.mp], equals([0, cleric.mp]));
    });

    test('pray() test3: 현재 mp ==8, 3초 기도 시 mp는 maxMp만큼 회복. 회복량은 2', () {
      cleric.mp = 8;
      int praySeconds = 3;
      int prayResult = cleric.pray(praySeconds: praySeconds);
      expect([prayResult, cleric.mp], equals([2, cleric.maxMp]));
    });

    test('pray() test4: 음수 초 기도 시 Exception throw', () {
      int praySeconds = -3;
      expect(() => cleric.pray(praySeconds: praySeconds), throwsException);
    });
  });
}
