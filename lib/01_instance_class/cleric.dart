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

//required를 쓰는때와 안 쓰는때를 구분하는 것이 좋을 것 가다.
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp}) {
    hp = max(maxHp, hp);
    mp = max(maxMp, mp);
  }

// Cleric에 이름있는 생성자 추가하는 방법 -> this를 this.name에 안쓰고, : this를 써서 불러오는 것을 이해하기
// Cleric.halfHpMp(String name) : this(name, hp: maxHp ~/ 2, mp: maxMp ~/ 2);
// .this에 접근이 안된다.

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
