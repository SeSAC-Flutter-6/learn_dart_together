abstract interface class Human {
  void speak(); // 필드가 없고 모든게 다 미정의

// 상속은 단일상속, 그러나 인터페이스는 다중 구현이 가능하다.
}

//보통 인터페이스는 기능만 본다. 추상클래스는 사물의 전체적인 특징을 다 보고 만듬.

class Man implements Human {
  @override
  void speak() {
    print('말합니다.');
  }
}
