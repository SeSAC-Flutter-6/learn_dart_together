import 'package:learn_dart_together/04_inheritance/slime/hero.dart';
import 'package:learn_dart_together/04_inheritance/slime/slime.dart';
import 'package:test/test.dart';

void main() {
  late Hero hero;
  late Slime slime;

  setUp(() {
    hero = Hero('용사');
    slime = Slime('A');
  });

  test('용사의 초기 hp는 50이다.', () {
    expect(hero.hp, 50);
  });

  test('용사의 hp는 음수가 되면 0으로 고정된다.', () {
    hero.hp = -1;
    expect(hero.hp, 0);
  });

  group('attack()', () {
    test('attack을 하면 slime의 hp는 10이 감소한다.', () {
      final hp = slime.hp;
      hero.attack(slime);
      expect(slime.hp, hp - 10);

      slime.hp = 5;
      hero.attack(slime);
      expect(slime.hp, 0);
    });
  });
}
