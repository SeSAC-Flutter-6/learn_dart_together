import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  Hero.money = 200;

  Hero hero = Hero(name: '홍길동', hp: 100);

  print(hero.title);

  hero.name = '';
}
