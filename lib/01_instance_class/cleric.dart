// 현실 세계의 성직자 '클레릭'를 표현하는 클래스 Cleric를 작성 하시오.
// 성직자는 이름, HP, MP를 가지고 있다.
// 이름, HP, 최대 HP, MP, 최대 MP 속성을 추가하시오.
// 또한 HP와 최대 HP는 정수로 초기치 50, MP와 최대 MP는 정수로 초기치 10
// 최대 HP와 최대 MP는 상수 필드로 선언
// 성직자는 '셀프 에이드'라는 마법을 사용, MP 5를 소비 -> HP를 최대 HP까지 회복
// Cleric 클래스에 selfAid() 메소드를 추가하기-> 인수 X, 리턴값도 X
// 기도하기(pray)라는 행동을 취하면, MP 회복
// 기도한 시간(초)에 따라서 0~2 포인트의 보정을 한 양이다. (3초 기도시 3~5포인트)
// 단 최대 MP 보다 더 회복은 불가능하다.
// Cleric 클래스에 pray() 메소드를 추가하기
// 이 메소드는 인수에 기도할 시간(초)를 지정할 수 있고, 리턴값은 '실제로 회복된 MP 양'을 반환

import 'dart:math';

void main() {}

class Cleric {
  String name;
  int hp;
  int mp;
  final int maxHp = 50;
  final int maxMp = 10;


  Cleric(
    this.name, {
    this.hp = maxHp,
    this.mp = maxMp,
  }) {
    hp = min(maxHp, hp);
    mp = min(maxMp, mp);
  }

  Cleric.halfHpMp(String name)
      : this(
          name,
          hp: maxHp ~/ 2,
          mp: maxMp ~/ 2,
        );


  void selfAid() {
    if (hp == maxHp) {
      print('HP가 최대라, selfAid() 사용할 필요없습니다');
      return;
    }
    //mp가 5소비가 되고, HP가 maxHp가 된다.
    if (hp < 50 && mp >= 5) {
      mp = mp - 5;
      hp = maxHp;
      print('mp 5를 소비하고, hp가 50으로 가득찹니다');
    } else {
      print('mp가 없어서 안됩니다');
      return;
    }
  }

  int pray(int seconds) {
    if (mp == maxMp) {
      print('MP가 최대라 pray()를 사용할 필요가 없습니다.');
      return 0; // MP 회복값은 0
    }
    print('마나 회복(초당 0~2 random 증가) 중');
    Random random = Random();
    // 기도 시간에 비례하여 무작위로 마나를 회복
    int recover = seconds + random.nextInt(3); // 0에서 2 사이의 무작위 값 추가
    int actualRecovery = min(recover, maxMp - mp); // 실제 회복량은 최대 MP를 초과하지 않도록 함
    mp = min(mp + recover, maxMp); // 최대 MP를 초과하지 않도록 보장
    return actualRecovery;
  }
}
