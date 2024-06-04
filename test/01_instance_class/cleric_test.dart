import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('selfAid()', () {
    test('hp는 최대치로 회복한다', () {
      final cleric = Cleric(name: '클레릭');

      cleric.selfAid();

      expect(cleric.hp, equals(Cleric.maxHp));
    });

    test('mp가 cost보다 낮다면 hp는 변하지 않는다', () {
      final cleric = Cleric(name: '클레릭', mp: 0);

      final lastHp = cleric.hp;

      cleric.selfAid();

      expect(cleric.hp, equals(lastHp));
    });

    test('mp는 cost만큼 소모된다', () {
      final cleric = Cleric(name: '클레릭');

      final lastMp = cleric.mp;

      cleric.selfAid();

      expect(cleric.mp, equals(lastMp - Cleric.selfAidCost));
    });
  });
  group('pray()', () {
    test('mp는 seconds + 0...2만큼 회복한다', () {
      final cleric = Cleric(name: '클레릭', mp: 0);

      cleric.pray(seconds: 5);

      expect(cleric.mp, inInclusiveRange(5, 7));
    });

    test('mp는 maxMp를 초과하지 않는다', () {
      final cleric = Cleric(name: '클레릭', mp: 45);
      cleric.pray(seconds: 5);

      expect(cleric.mp, lessThanOrEqualTo(Cleric.maxMp));
    });

    test('실제 회복량을 반환한다', () {
      final cleric = Cleric(name: '클레릭', mp: 0);

      final recoverAmount = cleric.pray(seconds: 5);

      expect(cleric.mp, recoverAmount);
    });
  });
}