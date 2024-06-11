import 'package:learn_dart_together/04_inheitance/point.dart';
import 'package:test/test.dart';


void main() {
  test('Rectangle이 point를 상속받아 올바른 top_left 좌표를 가지는지 테스트',() {
    //준비(given)
    Point topLeft = Point(3.0, 4.0);
    Rectangle rectangle = Rectangle(10.0, 20.0, topLeft);
    //검증(then)

    expect(rectangle.width ,equals(6.0));
    expect(rectangle.height ,equals(8.0));
    expect(rectangle.topLeft.x, equals(3.0));
    expect(rectangle.topLeft.y, equals(4.0));


  });
  
  test('Rectangle이 둘레와 면적을 제대로 표현하는지 테스트', () {
    //준비(given)
    Point topLeft = Point(3.0, 4.0);
    Rectangle rectangle = Rectangle(4.0, 5.0, topLeft);

    //검증(then)
    expect(rectangle.area, equals(20.0));
    expect(rectangle.parameter, equals(18));

  });
}

