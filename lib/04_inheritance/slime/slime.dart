import 'dart:math';

import 'hero.dart';

class Slime {
  final String suffix;
  int _hp;

  int get hp => _hp;

  set hp(int value) {
    if (value < 0) value = 0;
    _hp = value;
  }

  Slime(this.suffix, {hp = 50}) : _hp = max(hp, 0);

  void attack(Hero hero) {
    hero.hp = max(hero.hp - 10, 0);

    print('슬라임$suffix이/가 공격했다.');
    print('10의 데미지');
  }
}
