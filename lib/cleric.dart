import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static final int maxHp = 50;
  static final int maxMp = 10;
  static final int prayRandomValue = 2;
  static final int selfAidCost = 5;


  Cleric({
    required this.name,
    this.hp = 50,
    this.mp = 10,
  }) {
    hp = max(maxHp, hp);
    mp = max(maxMp, mp);
  }

  void selfAid() {
    if (mp >= selfAidCost) {
      mp -= selfAidCost;
      hp = maxHp;
    }
  }

  int pray(int praySecond) {
    final int mpRecovery = praySecond + Random().nextInt(prayRandomValue + 1);
    final originMp = mp;
    mp = min(mpRecovery + mp, maxMp);
    return (originMp + mpRecovery > maxMp) ? maxMp - originMp : mpRecovery;
  }
}
