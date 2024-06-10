import 'package:learn_dart_together/04_inheritance/practice_3/constants.dart';
import 'package:learn_dart_together/04_inheritance/practice_3/hero.dart';
import 'package:learn_dart_together/04_inheritance/practice_3/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  group('PoisonSlime attack 테스트', () {
    late PoisonSlime poisonSlime;
    late Hero hero;

    setUp(() {
      poisonSlime = PoisonSlime(suffix: '독');
      hero = Hero(name: '영웅');
    });

    test('$poisonMaxAttackCount회 공격 후에는 남은 공격 횟수는 0이 되어야 한다', () {
      for (var i = 0; i < poisonMaxAttackCount; i++) {
        poisonSlime.attack(hero);
      }
      expect(poisonSlime.poisonAttackCount, equals(0));
    });
    test('독 공격을 할 때, 항상 용사의 현재 HP의 1/5 만큼 데미지를 준다', () {
      int initialHp;
      for (var i = 0; i < poisonMaxAttackCount; i++) {
        initialHp = hero.hp;
        poisonSlime.attack(hero);
        expect(hero.hp, equals(initialHp - initialHp ~/ 5));
      }
    });
    test('독 공격 횟수가 0이면 독 공격이 아닌 일반공격을 한다', () {
      poisonSlime.poisonAttackCount = 0;
      int initialHp = hero.hp;
      poisonSlime.attack(hero);
      expect(hero.hp, equals(initialHp - 10));
    });
    test('독 공격 횟수는 항상 0 이상이다', () {
      poisonSlime.poisonAttackCount = 0;
      poisonSlime.attack(hero);
      expect(poisonSlime.poisonAttackCount, greaterThanOrEqualTo(0));
      poisonSlime.attack(hero);
      expect(poisonSlime.poisonAttackCount, greaterThanOrEqualTo(0));
    });
  });
}
