import 'package:learn_dart_together/06_polymorphism/a.dart';
import 'package:learn_dart_together/06_polymorphism/b.dart';
import 'package:learn_dart_together/06_polymorphism/x.dart';
import 'package:learn_dart_together/06_polymorphism/y.dart';

void main() {
  X obj = A();
  obj.a(); //obj는 a()메서드만 호출가능. 컴파일러는 obj를 X로 인식하기 때문

  Y y1 = A();
  Y y2 = B();

  y1.a(); // Aa
  y2.a(); // Ba

  A aInstance = A();
  B bInstance = B();

  List<Y> list =
      []; //Y는 X 인터페이스를 구현하고 있지만 X 인터페이스에는 b()메소드가 없다. 따라서 b()메소드를 호출하려면 리스트의 타입은 Y여야 한다.

  list.add(aInstance);
  list.add(bInstance);

  for (Y instance in list) {
    instance.b();
  }
}
