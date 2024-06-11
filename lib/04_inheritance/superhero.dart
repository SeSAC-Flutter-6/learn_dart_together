import 'package:learn_dart_together/01_instance_class/hero.dart';

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp});

  @override
  void run() {
    print('2번 run');
  }
}

void main() {
  final hero = Hero(name: "김영웅", hp: 10);
  final superhero = SuperHero(name: "박영웅", hp: 10);

  hero.run(); // 1번 run
  superhero.run(); // 2번 run
}
