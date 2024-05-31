import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  int mp = 10;
  final int maxHP = 50;
  final int maxMP = 10;

  Cleric({required this.name, required this.hp, required this.mp});

  selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHP;
    }
  }

  pray(int sec) {
    int recoveredMP = sec + Random().nextInt(3);
    mp += recoveredMP;
    if (mp >= maxMP) mp = maxMP;
    return recoveredMP;
  }
}
