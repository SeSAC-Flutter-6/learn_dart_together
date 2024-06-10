import 'package:learn_dart_together/04_inheitance/point.dart';
import 'package:test/test.dart';


void main() {
  test('Rectangle이 point를 상속받아 올바른 top_left 좌표를 가지는지 테스트',() {
    //준비(given)
    Rectangle rectangle = Rectangle(2.0, 4.0, 6.0, 8.0);

    //검증(then)
    expect(rectangle.x ,equals(2.0));
    expect(rectangle.y ,equals(4.0));
    expect(rectangle.width ,equals(6.0));
    expect(rectangle.height ,equals(8.0));
  });
  
  test('Rectangle이 둘레와 면적을 제대로 표현하는지 테스트', () {
    //준비(given)
    Rectangle rectangle = Rectangle(0, 0, 4.0, 5.0);

    //검증(then)
    expect(rectangle.area, equals(20.0));
    expect(rectangle.parameter, equals(18));
  });
}

