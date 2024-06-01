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
    this.mp = 10,
  });

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    }
  }

  int pray(int praySecond) {
    final int mpRecovery = praySecond + Random().nextInt(3);
    final originMp = mp;
    mp = min(mpRecovery + mp, maxMp);
    return (originMp + mpRecovery > maxMp) ? maxMp - originMp : mpRecovery;
  }
}
