/*
1. X obj = A();로 A의 인스턴스를 생성한 후,
변수 obj에서 호출할 수 있는 메소드는 X 인터페이스에 정의된 메서드인 a() 메서드다.
obj.a(); 만 호출할 수 있다.

2. Y y1 = A();와 Y y2 = B();로 A와 B의 인스턴스를 생성한 후에
y1.a();와 y2.a();를 실행했을 때는 각각 A와 B에 오버라이드된 함수가 실행된다.
변수 y1과 y2가 Y 클래스 타입을 참조하고 있지만,
해당 객체들이 각각 A와 B의 인스턴스를 가리키고 있기 때문에
각 객체의 타입인 A와 B에 오버라이드된 함수가 실행된다.
(Y타입의 객체인 A, B를 각각 참조)
*/

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}
