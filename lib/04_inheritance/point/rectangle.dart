import 'package:learn_dart_together/04_inheritance/point/point.dart';

class Rectangle {
  double width;
  double height;
  Point topLeft;

  Rectangle({
    required this.width,
    required this.height,
    required this.topLeft,
  });

  double get area => width * height;
  double get perimeter => 2 * (width + height);
}
