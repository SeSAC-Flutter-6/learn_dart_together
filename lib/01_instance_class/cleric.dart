import 'dart:math';

void main() {
  // Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);
  // cleric.selfAid();
}

class Cleric {
  String name;
  int hp;
  int mp;
  static const int maxHp = 50;
  static const int maxMp = 10;
  static const int consumeMp = 5;
  static const int randomMpValue = 3;

  Cleric({
    required this.name,
    this.hp = 50,
    this.mp = 10,
  }) {
    hp = max(maxHp, hp);
    mp = max(maxMp, mp);
  }

//selfAid()는 사실, return을 쓰면 안되는데, 통과 X, 위에서 옮기는 방법을 적어주면 좋을 것 같다.
  void selfAid() {
    //mp가 5소비가 되고, HP가 maxHp가 된다.
    if (mp >= consumeMp) {
      mp = mp - consumeMp;
      hp = maxHp;
      print('mp 5를 소비하고, hp가 50으로 가득찹니다');
    }
  }

  int pray(int seconds) {
    if (mp == maxMp) {
      print('MP가 최대라 pray()를 사용할 필요가 없습니다.');
    }
    print('마나 회복(초당 0~2 random 증가) 중');
    Random random = Random();
    print('Random은 $random');
    // 기도 시간에 비례하여 무작위로 마나를 회복
    int recover = seconds + random.nextInt(randomMpValue); // 0에서 2 사이의 무작위 값 추가
    int actualRecovery = min(recover, maxMp - mp); // 실제 회복량은 최대 MP를 초과하지 않도록 함
    mp = min(mp + recover, maxMp); // 최대 MP를 초과하지 않도록 보장
    return actualRecovery;
  }
}
