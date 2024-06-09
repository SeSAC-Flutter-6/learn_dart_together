import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/05_inheritance/poison_slime.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('포이즌 슬라임이 공격하면 추가로 히어로의 hp의 1/5 깎임', () {
    Hero hero = Hero(name: '슈퍼맨', hp: 1000);
    PoisonSlime poisonSlime = PoisonSlime('A');
    poisonSlime.attack(hero);
    expect(hero.hp, 792);
  });
  test('포이즌 슬라임이 공격하면 attackCount -1', () {
    Hero hero = Hero(name: '슈퍼맨', hp: 1000);
    PoisonSlime poisonSlime = PoisonSlime('A');
    poisonSlime.attack(hero);
    expect(poisonSlime.attackCount, 4);
    poisonSlime.attack(hero);
    expect(poisonSlime.attackCount, 3);
    poisonSlime.attack(hero);
    expect(poisonSlime.attackCount, 2);
    poisonSlime.attack(hero);
    expect(poisonSlime.attackCount, 1);
    poisonSlime.attack(hero);
    expect(poisonSlime.attackCount, 0);
    poisonSlime.attack(hero);
    expect(poisonSlime.attackCount, 0);
  });
  test('attackCount를 모두 소모하면 추가 공격 없음', () {
    Hero hero = Hero(name: '슈퍼맨', hp: 1000);
    PoisonSlime poisonSlime = PoisonSlime('A');
    poisonSlime.attack(hero);
    poisonSlime.attack(hero);
    poisonSlime.attack(hero);
    poisonSlime.attack(hero);
    expect(poisonSlime.plusDamage > 0, true);
    expect(poisonSlime.attackCount, 1);
    poisonSlime.attack(hero);
    expect(poisonSlime.plusDamage > 0, true); // 추가데미지
    expect(poisonSlime.attackCount, 0); // 카운트 -1. 다음번 추가 공격 없음
    poisonSlime.attack(hero);
    expect(poisonSlime.plusDamage, 0);
    expect(poisonSlime.attackCount, 0);
  });
}
