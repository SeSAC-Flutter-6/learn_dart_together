import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  // Slime slimeA = Slime(100, 'A');
  // Slime slimeB = Slime(100, 'B');
  Slime slimeA = Slime('A');
  Slime slimeB = Slime('B');

  Hero hero = Hero(name: '용사', hp: 100);

  hero.attack(slimeA);
  hero.attack(slimeB);
}

class Slime {
  // int hp = 50;
  final String suffix;
  // final int level = 10;
  // int hp;
  // String suffix;

  // Slime(this.hp, this.suffix);
  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= 10;
  }
}