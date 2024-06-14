import 'package:learn_dart_together/hero.dart';

void main() {
  String string = 'hello';

  Object object = '111';

  final heroes = <Hero> {};

  Hero hero1 = Hero(name: 'name', hp: 100);
  Hero hero2 = Hero(name: 'name', hp: 100);

  print(hero1 == hero2);
  print(hero1.toString());

  heroes.add(hero1);
  heroes.remove(hero2);

  print(heroes.length);

  print(hero1.hashCode);
  print(hero2.hashCode);



}

class AAA extends Object {

}