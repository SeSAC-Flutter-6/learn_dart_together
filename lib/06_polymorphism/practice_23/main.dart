import 'a.dart';
import 'b.dart';
import 'x.dart';
import 'y.dart';

void main() {
  X obj = A();
  obj.a();
  // obj.b(); 불가
  // obj.c(); 불가
  // b, c 메서드가 정의되어 있지만 X 인터페이스에는 없기 때문에 사용할 수 없다
  // X로만 선언되어 있기 때문에 X 인터페이스에 정의된 메서드만 사용할 수 있다
  // X로 선언되었기 때문에 클래스 A의 인스턴스지만 X로 보인다

  Y y1 = A();
  Y y2 = B();
  y1.a();
  y2.a();
  // 'Aa', 'Ba' 출력된다
  // y1과 y2의 타입은 런타임시 결정된다
  // 마찬가지로 Y로 선언되었기 때문에 클래스 A, B의 인스턴스지만 Y로 보인다

  // final objBox = <Y>[];
  List<Y> objBox = [];
  A obj1 = A();
  B obj2 = B();
  objBox.add(obj1);
  objBox.add(obj2);

  for (var obj in objBox) {
    obj.b();
  }

  // List 변수의 타입으로 무엇을 사용하여야 하는가?
  // Y를 사용하여야 한다
}
