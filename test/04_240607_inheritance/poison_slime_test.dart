import 'package:learn_dart_together/04_240607_inheritance/poision_slime.dart';
import 'package:test/test.dart';
import 'package:learn_dart_together/04_240607_inheritance/slime.dart';
import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('기본 공격 +독 데미지 -> hp의 1/5가 깎임', () {
    Hero hero = Hero(name: '군주', hp: 100);
    PoisonSlime poisonSlime = PoisonSlime('A');
    poisonSlime.attack(hero); // 인스턴스를 통해 메서드를 호출해야 합니다.
    expect(hero.hp, 72); // 90 - 18 = 72(기본공격으로 10깎이고, 20% 깎임(18)=> 72
  });

  test('포이즌 슬라임을 독 공격 횟수 제한 확인(5번)', () {
    Hero hero = Hero(name: '힘전사', hp: 1000);
    PoisonSlime poisonSlime = PoisonSlime('B');

    for (int i = 0; i < 5; i++) {
      poisonSlime.attack(hero);
      print('포이즌 슬라임 독 공격 ${i + 1}번째');
      print('hero hp:${hero.hp}');
    }

    expect(poisonSlime.poisonAttack, 0); // 포이즌 슬라임의 공격 기회가 5번으로 제한되었는지 확인
  });

  test('포이즌 슬라임 독 공격 6번째 시도', () {
    Hero hero = Hero(name: '힘전사', hp: 1000);
    PoisonSlime poisonSlime = PoisonSlime('B');

    for (int i = 0; i < 5; i++) {
      poisonSlime.attack(hero);
    }

    poisonSlime.attack(hero);
    expect(poisonSlime.poisonAttack, 0); // 여전히 0이어야 함
    print('6번째 공격 후 hero hp: ${hero.hp}');
  });
}
