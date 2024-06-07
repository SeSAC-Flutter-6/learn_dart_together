import 'dart:math';

class Cleric {
  static const int hpMax = 50;
  static const int mpMax = 10;
  String name;
  int hp;
  int mp;
  final int randomRange = 3;
  final int mpCost = 5;

  //static const int maxHp = 50;  이렇게 수정 후 생성자에서 사용하자.
  //static : 미리 정해 놓음. 정적

  Cleric(this.name, {this.hp = hpMax, this.mp = mpMax}) {
    hp = min(hp, hpMax);
    mp = min(mp, mpMax); // 인스턴스 생성 이후 접근됨(?)
  }

  // Cleric({required this.name, int hp = hpMax, int mp = mpMax})
  //     : hp = min(hp, hpMax),
  //       mp = min(mp, mpMax);

  void selfAid() {
    if (mp >= mpCost) {
      mp -= mpCost;
      hp = hpMax;
    }
  }

  int pray(int sec) {
    int recoveryAmount = sec + Random().nextInt(randomRange);
    if (mp + recoveryAmount < mpMax) {
      mp = mp + recoveryAmount;
      return recoveryAmount;
    } else {
      mp = mpMax;
      return mpMax - mp;
    }
  }
}
