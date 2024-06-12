import 'package:learn_dart_together/06_240612_polymorphism/x.dart';
import 'package:learn_dart_together/06_240612_polymorphism/y.dart';

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
//1. x obj = A();로 인스턴스를 생성한 후, 변수 obj에서 호출할 수 있는 메소드를 a(), b(), c() 중에 골라보시오.

void main() {
  X obj = A();
  obj.a();
}
