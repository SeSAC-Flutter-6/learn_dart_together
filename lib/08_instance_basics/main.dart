import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  String string = 'Hello';
  Object object = 111; // 컴파일타임에 정해짐
  object = 11;

  Set<Hero> heroes = {};

  Hero hero1 = Hero(name: '홍길동', hp: 100);
  Hero hero2 = Hero(name: '홍길동', hp: 100); // 속성이 같아도 우리가 개입하지 않으면 다른 것이다.

  print(hero1 == hero2); // 해시코드는 다르지만 ==을 재정의하여 true로 나온다.

  print(hero1.hashCode); // 메모리 주소는 아님.
  print(hero2.hashCode);

  heroes.add(hero1);
  heroes.add(hero2);
  print(heroes.length);

  print(hero1.toString()); // toString()생략하는 것임
}

class AAA extends Object {}
