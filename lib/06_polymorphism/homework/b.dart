import 'package:learn_dart_together/06_polymorphism/homework/a.dart';
import 'package:learn_dart_together/06_polymorphism/homework/x.dart';
import 'package:learn_dart_together/06_polymorphism/homework/y.dart';

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
  //연습문제2
  //obj에서 호출할 수 있는 메소드는 a()
  X obj = A();
  obj.a();

  //연습문제3
  //List 변수 타입은 Y
  List<Y> list = [];
  Y y1 = A();
  Y y2 = B();
  y1.a();
  y2.a();

  A a1 = A();
  B b1 = B();

  list.add(a1);
  list.add(b1);

/*  list.forEach((list) {
    list.b();
  });*/ // for문 권장?

  for (var list in list) {
    list.b();
  }
}
