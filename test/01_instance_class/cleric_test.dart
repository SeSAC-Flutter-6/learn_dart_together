import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric selfAid test', () {
    test('소유한 mp가 5 이상(충분): hp를 50으로 회복, mp를 5 소모', () {
      final cleric = Cleric('성직자', hp: 20, mp: 10);

      cleric.selfAid();

      expect((cleric.hp, cleric.mp), (50, 5));
    });

    test('소유한 mp가 5 미만(부족): hp, mp 변화 없음', () {
      final cleric = Cleric('성직자', hp: 20, mp: 3);

      cleric.selfAid();

      expect((cleric.hp, cleric.mp), (20, 3));
    });
  });

  group('Cleric pray test', () {
    test('소유한 mp가 maxMp 미만: 10 이하 범위에서 기도시간 + 0~2만큼 mp 회복', () {
      final cleric = Cleric('성직자', hp: 50, mp: 2);

      final result = cleric.pray(seconds: 3);

      expect(result, inInclusiveRange(3, 5));
    });

    test('소유한 mp가 maxMp: 기도시간과 무관하게 mp 회복량 없음', () {
      final cleric = Cleric('성직자', hp: 50, mp: 10);

      final result = cleric.pray(seconds: 3);

      expect(result, 0);
    });
  });
}
