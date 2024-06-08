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

  test('슬라임의 초기 hp는 50이다.', () {
    expect(slime.hp, 50);
  });

  test('슬라임의 hp는 음수가 되면 0으로 고정된다.', () {
    slime.hp = -1;
    expect(slime.hp, 0);
  });

  group('attack()', () {
    test('attack을 하면 hero의 hp는 10이 감소한다.', () {
      final hp = hero.hp;
      slime.attack(hero);
      expect(hero.hp, hp - 10);

      hero.hp = 5;
      slime.attack(hero);
      expect(hero.hp, 0);
    });
  });
}
