import 'dart:math';
import 'package:learn_dart_together/04_inheritance/constants/constants.dart';
import 'package:learn_dart_together/04_inheritance/slime.dart';

class Hero {
  String name;
  int hp;

  Hero({
    required this.name,
    required this.hp,
  });

  void attack(Slime slime) {
    if (hp < heroAttackCost) {
      print('$name의 HP가 낮아서 공격할 수 없습니다');
      return;
    }
    print('$name이 슬라임${slime.suffix}을 공격했다');
    hp -= heroAttackCost;
    slime.hp = max(slime.hp - heroAttackDamage, 0);
  }

  void run() {
    print('$name이 도망쳤다');
  }
}
