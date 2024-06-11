import 'package:learn_dart_together/05_inheritance/point/point.dart';

class Rectangle {
  int width;
  int height;
  Point topLeftPointer;

  int get area => width * height;

  int get perimeter => 2 * (width + height);

  Rectangle({
    required this.width,
    required this.height,
    required this.topLeftPointer,
  });
}
