import 'point.dart';

class Rectangle {
  double width;
  double height;
  Point topLeftPointer;

  double get area => width * height;
  double get perimeter => 2 * (width + height);

  Rectangle(
      {required this.width, required this.height, required this.topLeftPointer})
      : assert(width > 0),
        assert(height > 0);
}
