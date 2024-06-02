import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  int mp = 10;
  final int maxHp = 50;
  final int maxMp = 10;

  Cleric({required this.name});

  void selfAid() {
    //남은 mp가 5 이상일때만 발동가능
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    }
  }

  int pray({required int praySeconds}) {
    if (praySeconds > 0) {
      //회복 가능한 mp
      final int recoverableMp = praySeconds + Random().nextInt(3);
      //실제로 회복할 수 있는 mp => (recoverableMp + mp) 가 maxMp보다 크면 (maxMp - mp) , 작으면 recoverableMp
      final int actualRecoveredMp =
          (recoverableMp + mp > maxMp) ? maxMp - mp : recoverableMp;
      //mp 회복
      mp += actualRecoveredMp;
      return actualRecoveredMp;
    } else if (praySeconds == 0) {
      //0초 기도 시 아무런 효과도 일어나지 않음 (정확히 명세하지 않음)
      return 0;
    } else {
      //음수 초의 경우 Exception을 던진다.
      throw Exception('기도 시간은 음수가 될 수 없음');
    }
  }
}
