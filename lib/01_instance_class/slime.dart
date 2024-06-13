import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  Slime slimeA = Slime(100, 'A');
  Monster slimeB = Slime(100, 'B');

  slimeA.run();
  slimeB.run();

  //
  // Hero hero = Hero(name: '용사', hp: 100);
  //
  // hero.attack(slimeA);
  // hero.attack(slimeB);
}

class Slime extends Monster {
  final int level = 10;

  int hp;
  String suffix;

  Slime(this.hp, this.suffix);

  void attack() {

  }

  @override
  void run() {
    print('1');
  }

  @override
  String toString() {
    return 'Slime{hp: $hp, suffix: $suffix}';
  }
}

abstract class Monster {
  void run() {
    print('2');
  }
}
