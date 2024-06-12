import 'package:test/test.dart';
import 'package:learn_dart_together/04_240607_inheritance/point.dart';
import 'package:learn_dart_together/04_240607_inheritance/rectangle.dart';

void main() {
  group('Rectangle 클래스 테스트', () {
    final Point topLeft = Point(x: 0, y: 0);
    final Rectangle rectangle =
        Rectangle(width: 5.0, height: 10.0, topLeft: topLeft);

    test('면적이 올바르게 계산된다', () {
      expect(rectangle.area(), equals(50.0));
    });

    test('둘레가 올바르게 계산된다', () {
      expect(rectangle.perimeter(), equals(30.0));
    });
  });
}
