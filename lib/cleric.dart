import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  final int maxHp = 50;
  final int maxMp = 10;

  final int selfAidMpCost = 5;
  final int randomRange = 3;

  Cleric({
    required this.name,
    required this.hp,
    required this.mp,
  });

  void selfAid() {
    if (mp >= selfAidMpCost) {
      print('셀프에이드 성공!');
      mp -= selfAidMpCost;
      hp = maxHp;
    } else {
      print('MP가 부족합니다.');
    }
  }

  int pray(int praySecond) {
    print('기도하기!');
    int randomPoint = Random().nextInt(randomRange);
    int recoveryMp = praySecond + randomPoint;
    int totalMp = mp + recoveryMp;
    int realRecoveryMp;

    if (maxMp <= totalMp) {
      realRecoveryMp = maxMp - mp;
      mp = maxMp;
    } else {
      mp = totalMp;
      realRecoveryMp = recoveryMp;
    }

    print("회복된 MP: $realRecoveryMp");
    return realRecoveryMp;
  }
}
