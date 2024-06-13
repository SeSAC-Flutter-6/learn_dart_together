import 'dart:math';

import 'package:learn_dart_together/04_inheritance/slime/slime.dart';

class Hero {
  String name;
  int _hp;

  int get hp => _hp;

  set hp(int value) {
    if (value < 0) value = 0;
    _hp = value;
  }

  Hero(this.name, {hp = 50}) : _hp = max(hp, 0);

  void attack(Slime slime) {
    slime.hp = max(slime.hp - 10, 0);

    print('$name(이/가) ${slime.suffix}을 공격했다');
  }

  void run() {
    print('$name(이/가) 도망쳤다');
  }

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType &&
        other is Hero &&
        name == other.name;
  }
}
