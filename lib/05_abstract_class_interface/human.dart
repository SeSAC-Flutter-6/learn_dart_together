//추상클래스
abstract class Human {
  void speak();
}

//인터페이스 , 프로토콜 implements
abstract interface class Human2 {}

class Man implements Human {
  @override
  void speak() {
    // TODO: implement speak
  }
}

class Animal implements A, B {}

abstract interface class A {}

abstract interface class B {}

//룰
//abstract interface class 사용하면 implements
