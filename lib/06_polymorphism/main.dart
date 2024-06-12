class Slime extends Monster {
  int hp;
  String name;

  Slime(this.hp, this.name);

  @override
  void run() {
    print('1');
  }
}

abstract class Monster {
  void run() {
    print('2');
  }
}

abstract interface class A {} // 인터페이스는 메서드 없어도 됨: 그룹핑 하고 싶을때

abstract interface class B {}

class Dog implements A {} // A 그룹에 속함

class Desk implements A, B {} // 교집합도 가능

void main() {
  Slime slimeA = Slime(100, 'A');
  Monster slimeB = Slime(100, 'B');

  slimeA.run(); // '1'
  slimeB.run(); // '1'
}
