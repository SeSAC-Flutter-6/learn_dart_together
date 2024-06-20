import '../../hero.dart';

void main() {
  final heroes = <Hero> {};

  Hero hero1 = Hero(name: 'name', hp: 100);
  Hero hero2 = Hero(name: 'name', hp: 100);

  //print(hero1 == hero2);
  //print(hero1.toString());
  func(hero1);
  heroes.add(hero1);
  heroes.remove(hero2);

  //print(heroes.length);
}

void func(Hero hero) {
  hero.name ='홍길동';
  hero.run();
}