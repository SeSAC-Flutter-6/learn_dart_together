import 'dart:math';
import 'slime.dart';

class Hero {
  String name;
  double _hp;

  double get hp => _hp;
  set hp(double value) {
    _hp = max(0, value);
  }

  Hero({
    required this.name,
    required double hp,
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
