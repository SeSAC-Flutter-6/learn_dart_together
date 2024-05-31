import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('mp 부족!');
    }
  }

  int pray({required int seconds}) {
    int left = maxMp - mp;
    int recover = seconds + Random().nextInt(3);
    return min(left, recover);
  }
}
