import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
    test('사용 시 hp는 최대치로 회복한다', () {
      final cleric = Cleric(name: '클레릭');

      cleric.selfAid();

      expect(cleric.hp, equals(cleric.maxHp));
    });

    test('사용 시 mp가 cost보다 낮다면 hp는 변하지 않는다', () {
      final cleric = Cleric(name: '클레릭')
      ..mp = 0;

      final lastHp = cleric.hp;

      cleric.selfAid();

      expect(cleric.hp, equals(lastHp));
    });

    test('사용 시 mp는 cost만큼 소모된다', () {
      final cleric = Cleric(name: '클레릭');

      final lastMp = cleric.mp;

      cleric.selfAid();

      expect(cleric.mp, equals(lastMp - 5));
    });
}