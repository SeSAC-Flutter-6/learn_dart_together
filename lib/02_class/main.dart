import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  final hero1 = new Hero(name: 'name', hp: 100);
  final hero2 = hero1;

  hero2.hp = 200;

  // print(hero1.hp);

  // 레퍼런스 타입
  int i = 10;
  double d = 10.0;
  num n = i;
  bool b = true;

  String text = '11';

  Person person = Person();

  print(fibonacci(10000));
}

class Person {

  // Person() {
  //
  // }

  Person({int? age}) {

  }
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
