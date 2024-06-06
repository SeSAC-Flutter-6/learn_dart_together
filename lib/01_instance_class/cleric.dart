import 'dart:math';

void main() {
  // Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);
  final cleric = Cleric.halfHpMp('홍길동');
}

class Cleric {
  String name;
  int hp;

  // static final int maxHp = 50;
  static const int maxHp = 50;
  int mp;

  // static final int maxMp = 10;
  static const int maxMp = 10;

  // 생성자
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

  // Cleric(this.name, {this.hp = hpMax, this.mp = mpMax}) {
  // Cleric.halfHpMaxMp(this.name)
  //     : hp = maxHp ~/ 2,
  //       mp = maxHp ~/ 2);

  // Cleric.halfHpMaxMp(String name)
  //     : this(
  //     name,
  //     hp = maxHp ~/ 2,
  //     mp = maxHp ~/ 2
  //   //maxHp가 final 이면 안됨 constant한 값마 됨 변수 같은 것도 들어오면 안됨. 필드 접근이 안됨. initialize는 this에 접근이 안 됨 인스턴스가 된 이후에 돌지 않음
  // );

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = Cleric.maxHp;
      print('mp -5 maxHp 회복˙ᵕ˙ 현재 MP: $mp HP: $hp ');
    } else {
      print('mp가 5 미만! -5 불가 mp 회복 후 다시「(°ヘ°) 현재 MP: $mp HP: $hp');
    }
  }

  int pray(int second) {
    int recoveredMp = Random().nextInt(3) + second;
    int realRecoveredMp =
        recoveredMp + mp > Cleric.maxMp ? Cleric.maxMp - mp : recoveredMp;
    mp += realRecoveredMp;
    print("mp +$realRecoveredMp 회복되었어요˘ᵕ˘ 현재 MP: $mp HP: $hp");
    return realRecoveredMp;
  }
}
