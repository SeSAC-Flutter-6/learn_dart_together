import 'package:learn_dart_together/240531/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('selfAid()', () {
    test('실행시, hp가 maxHP로 회복', () {
      final cleric = Cleric(name: 'Cleric')..hp = 20;
      cleric.selfAid();
      expect(cleric.hp, equals(50));
    });
    test('실행시, mp가 5 감소', () {
      final cleric = Cleric(name: 'Cleric')..mp = 10;
      cleric.selfAid();
      expect(cleric.mp, equals(5));
    });
  });

  group('pray()', () {
    test('실행시, mp는 (sec + 0~2) 만큼 회복', () {
      final cleric1 = Cleric(name: 'Cleric1')
        ..hp = 20
        ..mp = 5;
      int recoveredMP = cleric1.pray(1);
      expect(recoveredMP, inInclusiveRange(1, 3));
    });
    test('실행시, 현재 mp가 최대 mp인 경우 실제 mp 회복량은 0', () {
      final cleric1 = Cleric(name: 'Cleric1')
        ..hp = 20
        ..mp = 10;
      int recoveredMP = cleric1.pray(1);
      expect(recoveredMP, equals(0));
    });
    test('실행시, 최대 mp 이상으로 회복은 불가', () {
      final cleric = Cleric(name: 'Cleric')
        ..hp = 20
        ..mp = 8;
      cleric.pray(3);
      expect(cleric.mp, equals(10));
    });
    test('실행시, 실제 회복된 mp 확인', () {
      final cleric1 = Cleric(name: 'Cleric1')
        ..hp = 20
        ..mp = 0;
      int recoveredMP = cleric1.pray(1);
      expect(cleric1.mp, recoveredMP);
    });
  });
}
