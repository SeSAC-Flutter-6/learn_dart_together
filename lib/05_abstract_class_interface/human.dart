//추상클래스
abstract class Human1 {
  void speak();
}

//인터페이스, 프로토콜
abstract interface class Human {
  //필드가 없다
  void speak();
}

class Man implements Human {
  @override
  void speak() {
    // TODO: implement speak
  }
}
