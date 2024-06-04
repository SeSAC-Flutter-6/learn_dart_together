import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;
  static const int hpMax = 50;
  static const int mpMax = 10;

  //static const int maxHp = 50;  이렇게 수정 후 생성자에서 사용하자.
  //static : 미리 정해 놓음. 정적

  Cleric(this.name, {this.hp = hpMax, this.mp = mpMax}) {
    hp = min(hp, hpMax);
    mp = min(mp, mpMax);
  }

  // Cleric({required this.name, int hp = hpMax, int mp = mpMax})
  //     : hp = min(hp, hpMax),
  //       mp = min(mp, mpMax);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = hpMax;
    }
  }

  int pray(int sec) {
    int recoveryAmount = sec + Random().nextInt(3);
    if (mp + recoveryAmount < mpMax) {
      mp = mp + recoveryAmount;
      return recoveryAmount;
    } else {
      mp = mpMax;
      return mpMax - mp;
    }
  }
}

