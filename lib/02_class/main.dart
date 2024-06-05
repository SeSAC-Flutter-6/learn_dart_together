import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  final hero1 = Hero(name: '홍길동', hp: 100);
  final hero2 = hero1; //주소복사 (값 복사가 아님)

  hero2.hp = 200;
  print(hero1.hp);
}

class Man {
  String name;
  int age;

  // 생성자 만들지 않아도 기본적으로 하나 있음 Man man = Man();
  //하나라도 만들면 기본 생성자 없게 된다.
  //둘다 하고 싶다? => {}를 이용하여 optional 로 만들어라
  Man(this.name, this.age);

  void walk(int meter) {}
//오버로드 : 이름은 같고 인풋이 다르게 만드는 것 (동일한 이름의 함수 혹은 생성자 만드는 것) -> 다트에서는  생성 못함.
//error
// void walk(double meter){
// }
//dart는 생성자 오버로드 효과를 가져올 수 있다. {}를 사용해서.
}
