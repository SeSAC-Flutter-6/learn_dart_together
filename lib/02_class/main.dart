import '../01_instance_class/hero.dart';

void main() {
  final hero1 = Hero(name: 'name', hp: 100);
  final hero2 = hero1;

  hero2.hp = 200;
  print(hero1.hp);
}
