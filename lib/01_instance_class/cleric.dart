import 'dart:math';

void main() {
  // Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);
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
  Cleric({
    required this.name,
    required this.hp,
    required this.mp,
  });

  Cleric.name({
    required this.name,
    this.hp = Cleric.maxHp,
    this.mp = Cleric.maxMp,
  }) {
    hp = min(hp, maxHp);
    mp = min(mp, maxMp);
  }

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
