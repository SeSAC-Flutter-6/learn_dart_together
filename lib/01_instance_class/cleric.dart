import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;

  final int maxHp = 50;
  final int maxMp = 10;

  Cleric({
    required this.name,
    this.hp = 50,
    this.mp = 10
  });

  void selfAid() {
    final int cost = 5;

    if (mp < cost) return;

    mp -= cost;
    hp = maxHp;
  }

  int pray(int seconds) {
    final randMod = Random().nextInt(3);
    final recoverMod = seconds + randMod;

    final lastMp = mp;
    mp = min(maxMp, mp + recoverMod);

    final recoverAmount = mp - lastMp;

    return recoverAmount;
  }
}