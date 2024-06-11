import 'dart:math';
import 'slime.dart';

class Hero {
  String name;
  int _hp;

  int get hp => _hp;
  set hp(int value) {
    _hp = max(0, value);
  }

  Hero({
    required this.name,
    required int hp,
  }) : _hp = hp {
    this.hp = hp;
  }

  void attack(Slime slime) {
    print('$name이 $slime을 공격했다!');
    slime.hp -= 10;
  }

  void run() {
    print('1번 run');
  }

  void sleep() {
    hp = 100;
  }
}
