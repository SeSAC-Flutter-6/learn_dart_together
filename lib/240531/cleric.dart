import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static const int maxHP = 50;
  static const int maxMP = 10;

  Cleric(this.name, {this.hp = maxHP, this.mp = maxMP}) {
    hp = min(hp, maxHP);
    mp = min(mp, maxMP);
  }

  selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHP;
    }
  }

  pray(int sec) {
    int tempMP;
    int recoveredMP = 0;

    if (mp < maxMP) {
      recoveredMP = sec + Random().nextInt(3);
      tempMP = mp;
      mp += recoveredMP;

      if (mp > maxMP) {
        recoveredMP = maxMP - tempMP;
        mp = maxMP;
      }
    }

    return recoveredMP;
  }
}
