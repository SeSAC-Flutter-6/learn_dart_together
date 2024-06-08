import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/04_inheritance/poisonslime.dart';
import 'package:test/test.dart';

void main() {
  group('PoisonSlime attack test', () {
    test('남은 독공격이 있고, 일반공격 후 용사의 hp가 0보다 클때', () {
      PoisonSlime slime = PoisonSlime('1');
      Hero hero = Hero(name: '용사1', hp: 30.0);

      slime.attack(hero);
      expect((slime.poisonAttackLeft, hero.hp), (4, 16.0));

      slime.attack(hero);
      expect((slime.poisonAttackLeft, hero.hp), (3, 4.8));
    });

    test('남은 독공격이 있고, 일반공격 후 용사가 죽었을때', () {
      PoisonSlime slime = PoisonSlime('2');
      Hero hero = Hero(name: '용사2', hp: 8.0);

      slime.attack(hero);
      expect((slime.poisonAttackLeft, hero.hp), (4, 0.0));
    });

    test('남은 독공격이 없을때(일반 공격은 가능)', () {
      PoisonSlime slime = PoisonSlime('3');
      Hero hero = Hero(name: '용사3', hp: 12.0);

      slime.poisonAttackLeft = 0;
      slime.attack(hero);

      expect((slime.poisonAttackLeft, hero.hp), (0, 2.0));
    });
  });
}
