import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';

void main() {
  late Cleric cleric;

  group('Cleric constructor test', () {
    test('(1): mp, hp 설정 x', () {
      Cleric cleric = Cleric('기본성직자');
      expect([cleric.hp, cleric.mp], equals([50, 10]));
    });
    test('(2): hp만 설정', () {
      Cleric cleric = Cleric('기본성직자', hp: 35);
      expect([cleric.hp, cleric.mp], equals([35, 10]));
    });
    test('(3): mp, hp  max치보다 낮게 설정', () {
      Cleric cleric = Cleric('빈약한 성직자', hp: 25, mp: 5);
      expect([cleric.hp, cleric.mp], equals([25, 5]));
    });
    test('(4): mp, hp  max치보다 높게 설정', () {
      Cleric cleric = Cleric('개쩌는 성직자', hp: 100000, mp: 10000);
      expect([cleric.hp, cleric.mp], equals([Cleric.maxHp, Cleric.maxMp]));
    });
  });

  group('Cleric method test', () {
    setUpAll(() {
      cleric = Cleric('기본성직자');
    });
    test('selfAid() - (1): 사용 시 5 차감, hp max회복 확인', () {
      //test를 위해 hp를 30으로 설정
      cleric.mp = Cleric.maxMp;
      cleric.hp = 30;
      cleric.selfAid();
      expect([cleric.hp, cleric.mp], equals([Cleric.maxHp, 5]));
    });

    test('selfAid() - (2): mp가 5 미만일 때 아무런 효과 없음', () {
      //test를 위해 mp를 2로 설정
      cleric.mp = 2;
      cleric.selfAid();
      expect([cleric.hp, cleric.mp], equals([cleric.hp, cleric.mp]));
    });

    test('pray() - (1): 현재 mp ==2, 3초 기도 시 3~5만큼의 mp 회복', () {
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

    test('pray() - (2): 0초 기도 시 회복량 0', () {
      int praySeconds = 0;
      int prayResult = cleric.pray(praySeconds: praySeconds);
      expect([prayResult, cleric.mp], equals([0, cleric.mp]));
    });

    test('pray() - (3): 현재 mp ==8, 3초 기도 시 mp는 maxMp만큼 회복. 회복량은 2', () {
      cleric.mp = 8;
      int praySeconds = 3;
      int prayResult = cleric.pray(praySeconds: praySeconds);
      expect([prayResult, cleric.mp], equals([2, Cleric.maxMp]));
    });

    test('pray() - (4): 음수 초 기도 시 Exception throw', () {
      //경계선에 있는 애들로 테스트하는게 좋음
      //0,1 테스트 성공 시 양수는 모두 성공한걸로 간주 -1.-2테스트 하면 그 밑으론 다 된걸로 간주
      expect(() => cleric.pray(praySeconds: 1), returnsNormally);
      expect(() => cleric.pray(praySeconds: 0), returnsNormally);
      //-1.-2테스트 하면 음수는 모두 예외를 던진다고 간주
      expect(() => cleric.pray(praySeconds: -1), throwsException);
      expect(() => cleric.pray(praySeconds: -2), throwsException);
    });
  });
}
