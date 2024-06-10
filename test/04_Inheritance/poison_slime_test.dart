import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/04_Inheritance/poison_slime.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

late PoisonSlime slime;
late Hero hero;
void main() {
  group('Poison Slime', () {
    setUp(() {
      slime = PoisonSlime('A');
      hero = Hero(name: '홍길동', hp: 100);
    });
    test('공격 시 공격 포인트가 1 감소한다.', () {
      slime.attack(hero);
      expect(slime.attackPoint, 4);      
      slime.attack(hero);
      expect(slime.attackPoint, 3);      
      slime.attack(hero);
      expect(slime.attackPoint, 2);      
      slime.attack(hero);
      expect(slime.attackPoint, 1);      
      slime.attack(hero);
      expect(slime.attackPoint, 0);
    });
    test('공격 시 히어로의 체력이 감소한다.', () {
      slime.attack(hero);
      expect(hero.hp, 72);
    });
    test('스킬 포인트가 0이라면 스킬 공격은 하지 않는다.', () {
      slime.attackPoint = 0;
      slime.attack(hero);
      expect(hero.hp, 90);
    });
  });
}