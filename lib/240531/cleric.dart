import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  final int maxHP = 50;
  final int maxMP = 10;

  Cleric({required this.name, this.hp = 50, this.mp = 10});

  selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHP;
    }
  }

  pray(int sec) {
    int recoveredMP;

    if (mp == maxMP) {
      recoveredMP = 0;
    } else {
      recoveredMP = sec + Random().nextInt(3);
      mp += recoveredMP;

      if (mp > maxMP) {
        recoveredMP = mp - maxMP;
        mp = maxMP;
      }
    }

    return recoveredMP;
  }
}
