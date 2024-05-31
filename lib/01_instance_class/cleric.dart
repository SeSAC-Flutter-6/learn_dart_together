import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  int mp = 50;
  final int hpMax = 50;
  final int mpMax = 10;

  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    if (mp > 5) {
      mp -= 5;
      hp = hpMax;
    }
  }

  int pray(int sec) {
    int recoveryAmount = sec += Random().nextInt(3);
    if (mp + recoveryAmount < mpMax) {
      mp = mp + recoveryAmount;
      return recoveryAmount;
    } else {
      mp = mpMax;
      return mpMax - mp;
    }
  }
}

void main() {
  Cleric cleric = Cleric('name', 30, 2);
  print(cleric.pray(5));
}
