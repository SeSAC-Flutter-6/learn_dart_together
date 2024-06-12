// 이런 클래스가 선언되어 있다.
// 다음 물음에 답하시오
// X obj = A(); 로 A인스턴스를 생성한 후, 변수 obj에서 호출할 수 있는 메소드를 a(), b(), c() 중에 골라보시오
import 'package:learn_dart_together/07_polymorphism/practice_02/a.dart';
import 'package:learn_dart_together/07_polymorphism/practice_02/b.dart';
import 'package:learn_dart_together/07_polymorphism/practice_02/x.dart';
import 'package:learn_dart_together/07_polymorphism/practice_02/y.dart';

void main() {
  // 추상클래스 Y를 상속받아 오버라이드를 a,b,c를 했다면 클래스 A는 extends를 했기때문에
  // Y가 가지고 있는 b(); 메소드만 호출 가능 같음

  X obj = A() as X;
  obj.a();

  // Y y1 = new A();
  // Y y2 = new B(); 로 A와 B의 인스턴스를 생성한 후
  // y1.a();
  // y2.a(); 를 실행했을 때에 화면에 표시되는 내용을 말하시오.

  // Y 타입으로 y1, y2의 변수에 각각 A인스턴스와 B인스턴스를 가리키고 있다..
  // 그런데 Y타입에는 a()메소드가 존재하지 않으므로
  // 각각 A인스턴스의 a()메소드 / B인스턴스의 a()메소드를 호출한다
  // 는데 어 많이 어지럽다;; .a는 오류나는데..
  Y y1 = A();
  Y y2 = B();
  //Y.a();
  //y2.a();

  // 문제 2 에서 이용한 A클래스나 B클래스의 인스턴스를 각각 1개씩 생성하여, List 에 차례로 담는다.
  // 그 후에 List 의 요소를 차례대로 꺼내 각각의 인스턴스의 b() 메소드를 호출 하여야 한다. 이상을 전제로 다음 물음에 답하시오.
  // List 변수의 타입으로 무엇을 사용하여야 하는가
  // 위에서 설명하고 있는 프로그램을 작성하시오
  List<Y> list = [];
  list.add(y1);
  list.add(y2);

  for (Y e in list) {
    e.b;
  }
}
