import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;

  Cleric({
    required this.name, 
    required this.hp,
    required this.mp
  });

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
