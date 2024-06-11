import 'package:learn_dart_together/04_inheritance/retangle/point.dart';
import 'package:learn_dart_together/04_inheritance/retangle/retangle.dart';
import 'package:test/test.dart';

void main() {
  late Retangle retangle;
  final double width = 2.5;
  final double height = 2;
  final double x = 3;
  final double y = 5;

  setUpAll(() {
    retangle = Retangle(width, height, Point(x, y));
  });

  test('Area of retangle test', () {
    expect(retangle.area, width * height);
  });

  test('Round of retangle test', () {
    expect(retangle.round, 2 * (width + height));
  });
}
