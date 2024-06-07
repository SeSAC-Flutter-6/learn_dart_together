import 'package:learn_dart_together/01_instance_class/hero.dart';

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp}) {
    print('2. SuperHero 생성자');
  }

  @override
  void run() {
    super.run();  // Hero run 호출
    print('2번 run');
    super.run();  // Hero run 호출
  }
}

void main() {
  // final hero = Hero(name: 'name', hp: 100);
  final superHero = SuperHero(name: 'name', hp: 100);

  // 1 -> 2
  // 2 -> 1

  // hero.run(); // 1번 run
  // superHero.run();  // 2번 run
}