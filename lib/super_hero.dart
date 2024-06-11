import 'hero.dart';

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp});

  @override
  void run() {
    super.run();
    print('2번 run');
  }

}

void main() {
  final hero = Hero(name: 'name', hp: 100);
  final superHero = SuperHero(name: 'name', hp: 100);
  //hero.run();
  superHero.run();
}