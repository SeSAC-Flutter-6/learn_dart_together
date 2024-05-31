import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;

  Cleric({required this.name});

  void selfAid() {
    //남은 mp가 5 이상이면 5만큼 차감
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('MP가 부족합니다');
    }
  }

  int pray({required int praySeconds}) {
    //회복 가능한 mp
    int recoverableMp = praySeconds + Random().nextInt(3);

    //실제로 회복할 수 있는 mp => (recoverableMp + mp) 가 maxMp보다 크면 (maxMp - mp) , 작으면 recoverableMp
    int actualRecoveredMp =
        (recoverableMp+mp > maxMp) 
          ? maxMp - mp 
          : recoverableMp;
    
    //mp 회복
    mp += actualRecoveredMp;
    
    return actualRecoveredMp;
  }
}
