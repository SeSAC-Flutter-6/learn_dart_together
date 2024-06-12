import 'package:learn_dart_together/06_240612_polymorphism/a.dart';
import 'package:learn_dart_together/06_240612_polymorphism/y.dart';

class B extends Y {
  @override
  void a() {
    print('Bb');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

//2. Y y1 = A(); Y y2 = B();로 A와 B의 인스턴스를 생성한 후, y1.a(); y2.a();를 실행했을 때에 화면에
//표시되는 내용을 말하시오.

void main() {
  Y y1 = A();
  Y y2 = B();

  y1.a(); //Aa 출력 됨
  y2.a(); //Bb 출력 됨

//3. 연습문제 3 -> List에 차례대로 담고, List의 요소를 차례대로 꺼내 각각의 인스턴스의 b() 메서드를 호출

  // List 변수의 타입을 Y로 사용하여야 합니다.
  List<Y> list = [y1, y2];

  // 리스트의 요소를 차례대로 꺼내 각각의 인스턴스의 b() 메소드를 호출합니다.
  for (Y y in list) {
    y.b(); // 각각 Ab와 Bb 출력
  }
}
