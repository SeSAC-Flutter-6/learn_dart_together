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

void main() {
  X obj = A();

  // ojb에서 호출할 수 있는 메소드는 a이다.
  // 왜냐하면, A() 객체 자체는 a, b, c 모두에 대한 메소드 테이블을 가지고 있겠지만,
  // A() 객체를 저장하고 있는 obj 변수는 X 타입으로 추상화되었기 때문에 a 메소드만 호출 가능하다.

  Y y1 = A();
  Y y2 = B();

  y1.a(); // Aa
  y2.a(); // Ba

  List<Y> list = [];
  list.add(y1);
  list.add(y2);

  list.forEach((item) {
    item.b();
  });

  // List 변수의 타입은 Y로 사용할 수 있음
}