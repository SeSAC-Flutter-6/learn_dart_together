import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  final heroes = <Hero>{};

  final h1 = Hero(name: "aa", hp: 50);
  final h2 = Hero(name: "bb", hp: 50);

  heroes.add(h1);

  void func(Hero hero) {
    hero.name = '길동이';
  }
}
