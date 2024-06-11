import 'package:learn_dart_together/01_instance_class/hero.dart';

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp});

  @override
  void run() {
    print('날라서 도망갔다');
  }
}

void main() {
  final hero = Hero(name: 'name', hp: 100);
  final superHero = SuperHero(name: 'name', hp: 100);

  hero.run();
  superHero.run();
}
