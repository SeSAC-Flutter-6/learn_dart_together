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
    required this.mp,
  });

  void selfAid() {
    if ((mp - 5) >= 0) {
      print('셀프에이드 성공!');
      mp = mp - 5;
      hp = maxHp;
    } else {
      print('MP가 부족합니다.');
    }
  }

  int pray(int praySecond) {
    print('기도하기!');
    int randomPoint = Random().nextInt(3);
    int recoveryMp = praySecond + randomPoint;
    int totalMp = mp + recoveryMp;
    int realRecoveryMp = 0;

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
