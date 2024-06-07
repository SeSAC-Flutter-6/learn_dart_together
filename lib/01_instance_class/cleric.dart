import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static const maxHp = 50;
  static const maxMp = 10;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp}) {
    hp = min(hp, maxHp);
    mp = min(mp, maxMp);
  }

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('mp 부족!');
    }
  }

  int pray({required int seconds}) {
    final int left = maxMp - mp;
    final int pray = seconds + Random().nextInt(3);
    final int recovery = min(left, pray);
    mp += recovery;
    return recovery;
  }
}
