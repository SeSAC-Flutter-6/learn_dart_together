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
      PoisonSlime.poisonAttackCount = 5;
    });

    test('poisonAttackCount가 5일 때, attack()을 호출하면 poisonAttackCount는 4가 되어야한다.', () {
      poisonSlime.attack(hero);
      expect(PoisonSlime.poisonAttackCount, equals(4));
    });

    test('Hero Hp가 50일 때, attack()을 호출하면 Hero hp는  32가 되어야한다.', () {
      poisonSlime.attack(hero);
      expect(hero.hp, equals(32));
    });

    test('poisonAttackCount가 0일 때, attack()을 호출하면 Hero hp가 -10 이 되어야한다. ', () {
      PoisonSlime.poisonAttackCount = 0;
      poisonSlime.attack(hero);
      expect(hero.hp, equals(40));
    });
  });
}
