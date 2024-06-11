import 'package:learn_dart_together/04_inheritance/retangle/point.dart';

class Retangle {
  double width;
  double height;
  Point topLeft;

  double get area => width * height;

  double get round => 2 * (width + height);

  Retangle(this.width, this.height, this.topLeft);
}
