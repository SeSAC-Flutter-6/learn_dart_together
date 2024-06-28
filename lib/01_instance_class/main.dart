import 'hero.dart';

void main() {
  final hero1 = new Hero(name: 'name', hp: 100);
  final hero2 = hero1; //주소가 복사 됨. 값이 복사되는 것이 아님
  // final 아빠 = 선생님 => 변수 이름은 중요치 않다
  // final 아빠 = 선생님 => 실체: 선생님이고 변수 이름은 중요치 않다

  hero2.hp = 200;
  print(hero2);
}
// class Person {
//   final String name;
//   final int age;
//   //initialize list
//   Person(this.name, {int age});
// }
