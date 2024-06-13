
import 'hero.dart';

void main() {
  Slime slimeA = Slime(100, 'A');
  Slime slimeB = Slime(100, 'B');

  Hero hero = Hero(name: '용사', hp: 100);

  hero.attack(slimeA);
  hero.attack(slimeB);
}

class Slime {
  final int level = 10;

  int hp;
  String suffix;

  Slime(this.hp, this.suffix);

  void attack() {

  }

  @override
  String toString() {
    return 'Slime{level: $level, hp: $hp, suffix: $suffix}';
  }
}