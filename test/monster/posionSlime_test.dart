import 'package:learn_dart_together/04_inheritance/slime/hero.dart';
import 'package:learn_dart_together/04_inheritance/slime/poisonSlime.dart';
import 'package:test/test.dart';

void main() {
  late Hero hero;
  late PoisonSlime poisonSlime;

  setUp(() {
    hero = Hero('용사');
    poisonSlime = PoisonSlime('A');
  });

  test('슬라임의 초기 hp는 50이다.', () {
    expect(poisonSlime.hp, 50);
  });

  test('슬라임의 hp는 음수가 되면 0으로 고정된다.', () {
    poisonSlime.hp = -1;
    expect(poisonSlime.hp, 0);
  });

  group('attack()', () {
    test('attack을 하면 hero의 hp는 10 + 공격 후 hp의 1/5이 추가로  감소한다.', () {
      final heroHp = hero.hp;
      final count = poisonSlime.attackableCount;
      poisonSlime.attack(hero);

      expect(hero.hp, (heroHp - 10) ~/ 5 * 4);
      expect(poisonSlime.attackableCount, count - 1);
    });

    test('attack을 하면 용사의 hp에 관계 없이 공격횟수가 1 감소한다.', () {
      final count = poisonSlime.attackableCount;
      hero.hp = 5;
      poisonSlime.attack(hero);

      expect(hero.hp, 0);
      expect(poisonSlime.attackableCount, count - 1);
    });

    test('attack 횟수가 없으면 독 데미지는 없다.', () {
      final heroHp = hero.hp;
      poisonSlime = PoisonSlime('A', attackableCount: 0);
      poisonSlime.attack(hero);

      expect(hero.hp, heroHp - 10);
    });
  });
}
