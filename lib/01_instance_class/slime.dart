import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  Slime slime = Slime(100, 'A');
  Slime slime1 = Slime(100, 'B');

  Hero hero = Hero(name: '홍길동', hp: 100);
}

class Slime {
  int hp;
  String suffix;
  final int level = 10; // 변하지 않았으면 좋겠어. field를 상수로 선언

  Slime(this.hp, this.suffix);

  void attack() {}
}
