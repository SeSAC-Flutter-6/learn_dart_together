import 'package:learn_dart_together/inheritance/rectangle/point.dart';

class Rectangle {
  double width;
  double height;
  Point topLeft;

  Rectangle({required this.width, required this.height, required this.topLeft});

  double get area {
    return width * height;
  }

  double get round {
    return (width + height) * 2;
  }

}

void main() {
  Point point = Point(x: 10.0, y: 20.0);
  Rectangle rectangle = Rectangle(width: 10.0, height: 20.0, topLeft: point);
  print(rectangle.area);
  print(rectangle.round);
}