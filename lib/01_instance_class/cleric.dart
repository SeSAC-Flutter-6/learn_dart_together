import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static const int maxHp = 50;
  static const int maxMp = 10;
  static const int prayRandomValue = 2;
  static const int selfAidCost = 5;

  Cleric(
    this.name, {
    this.hp = maxHp,
    this.mp = maxMp,
  }) {
    hp = min(hp, maxHp);
    mp = min(mp, maxMp);
  }

  void selfAid() {
    if (mp >= selfAidCost) {
      mp -= selfAidCost;
      hp = maxHp;
    }
  }

  int pray(int praySecond) {
    final int mpRecovery =
        praySecond + Random().nextInt(Cleric.prayRandomValue + 1);
    final originMp = mp;
    mp = min(mpRecovery + mp, maxMp);
    return (originMp + mpRecovery > maxMp) ? maxMp - originMp : mpRecovery;
  }
}
