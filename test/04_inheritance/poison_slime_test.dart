import 'package:learn_dart_together/04_inheritance/constants/constants.dart';
import 'package:learn_dart_together/04_inheritance/hero.dart';
import 'package:learn_dart_together/04_inheritance/poison_slime.dart';
import 'package:learn_dart_together/04_inheritance/slime.dart';
import 'package:test/test.dart';

void main() {
  group('PoisonSlime test', () {
    test('1: 독슬라임은 기본슬라임의 hp의 두배이다', () {
      Slime slime = Slime('normal');
      PoisonSlime poisonSlime = PoisonSlime('poison');
      expect(poisonSlime.hp, slime.hp * 2);
    });
    test('2: 독슬라임의 공격은 기본공격과 추가 독 공격으로 이루어진다. 독 공격은 가능한 횟수가 남아있다면 무조건 발동된다',
        () {
      Hero hero = Hero(name: '테스트용사', hp: 1000);
      PoisonSlime poisonSlime = PoisonSlime('poison');
      expect(poisonSlime.poisonAttackCount, slimeMaxPoisonAttackCount);
      while (poisonSlime.poisonAttackCount > 0) {
        poisonSlime.attack(hero);
      }
      expect(poisonSlime.poisonAttackCount, 0);
    });
    test('3: 남은 독 공격 횟수가 없다면 기본 공격만 수행한다', () {
      Hero hero = Hero(name: '테스트용사', hp: 1000);
      PoisonSlime poisonSlime = PoisonSlime('poison');
      while (poisonSlime.poisonAttackCount > 0) {
        poisonSlime.attack(hero);
      }
      poisonSlime.attack(hero);
      expect(poisonSlime.poisonAttackCount, 0);
      poisonSlime.attack(hero);
      expect(poisonSlime.poisonAttackCount, 0);
    });
    test('4: 기본 공격으로 이미 히어로의 hp가 0이 되었어도, 독 공격 횟수가 남아있다면 독 공격이 발동되지만 0 데미지를 준다',
        () {
      Hero hero = Hero(name: '개피용사', hp: slimeAttackDamage);
      PoisonSlime poisonSlime = PoisonSlime('poison');
      poisonSlime.attack(hero);
      expect(poisonSlime.poisonAttackCount, slimeMaxPoisonAttackCount - 1);
    });
    test('5: 히어로의 hp가 0이 되었어도, 공격할 수 있으나 0 데미지를 준다', () {
      Hero hero = Hero(name: '다죽어가는용사', hp: 0);
      PoisonSlime poisonSlime = PoisonSlime('poison');
      expect(() => poisonSlime.attack(hero), returnsNormally);
    });
  });
}
