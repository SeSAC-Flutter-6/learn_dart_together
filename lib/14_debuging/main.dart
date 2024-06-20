import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  final heroes = <Hero>{};

  final h1 = Hero(name: 'name', hp: 100);
  final h2 = Hero(name: 'name', hp: 100);

  func(h1);

  heroes.add(h1);
  print(heroes.length);

  heroes.remove(h2);
  print(heroes.length);
}

void func(Hero hero) {
  hero.name = '홍길동';
}
