import 'dart:math';
import 'package:learn_dart_together/04_inheritance/constants/constants.dart';
import 'package:learn_dart_together/04_inheritance/hero.dart';

class Slime {
  int hp = slimeDefaultHP;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    if (hp <= 0) {
      print('슬라임$suffix이/가의 HP가 없음. 공격 불가');
      return;
    }
    print('슬라임$suffix이/가 공격했다.');
    int actualAttackDamage = min(hero.hp, slimeAttackDamage);
    print('$actualAttackDamage 데미지 입힘');
    hero.hp -= actualAttackDamage;
  }
}
