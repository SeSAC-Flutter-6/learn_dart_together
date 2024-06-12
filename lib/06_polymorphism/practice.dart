void main() {
  X obj = A();
  Y y1 = A();
  Y y2 = B();

  // 연습문제 2
  obj.a(); // a()만 호출 가능하다. X타입으로 선언되어 있기 때문

  y1.a(); // Aa
  y2.a(); // Bb

  // 연습문제 3
  List<Y> list = []; // a, b의 공통된 타입이면서 b() 메서드를 가지는 Y

  A a = A();
  B b = B();

  list.add(a);
  list.add(b);

  list.forEach((obj) => obj.b());
}

abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

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
