import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  final int maxHp;
  final int maxMp;

  Cleric({
    required this.name,
    this.hp = 50,
    this.mp = 10,
    this.maxHp = 50,
    this.maxMp = 10,
  });

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    }
  }

  int pray(int praySecond) {
    final int mpRecovery = praySecond + Random().nextInt(3);
    return (mp + mpRecovery > maxMp) ? maxMp - mp : mpRecovery;
  }
}
