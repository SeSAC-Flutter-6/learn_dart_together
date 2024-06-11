import 'package:learn_dart_together/hero.dart';
import 'package:learn_dart_together/inheritance/slime/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  group('attack 테스트', () {
    late PoisonSlime poisonSlime;
    late Hero hero;

    setUp(() {
      poisonSlime = PoisonSlime('독슬라임');
      hero = Hero(name: '아이언맨', hp: 50);
    });

    test('PoisonSlime 객체 생성시 poisonAttackCount 기본 값은 5가 되어야한다.', () {
      expect(poisonSlime.poisonAttackCount, equals(5));
    });

    test('poisonAttackCount가 5일 때, attack()을 호출하면 poisonAttackCount는 4가 되어야한다.', () {
      poisonSlime.attack(hero);
      expect(poisonSlime.poisonAttackCount, equals(4));
    });

    test('Hero Hp가 50일 때, attack()을 호출하면 Hero hp는  32가 되어야한다.', () {
      poisonSlime.attack(hero);
      expect(hero.hp, equals(32));
    });

    test('poisonAttackCount가 0일 때, attack()을 호출하면 Hero hp가 -10 이 되어야한다. ', () {
      poisonSlime = PoisonSlime('독슬라임', poisonAttackCount: 0);
      poisonSlime.attack(hero);
      expect(hero.hp, equals(40));
    });
  });
}
