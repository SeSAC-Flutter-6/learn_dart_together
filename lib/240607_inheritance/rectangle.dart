/* Point 클래스를 만들고 x 및 y 좌표와 같은 속성을 포함합니다.
Rectangle 클래스를 만들고 width, height, top-left 포인터와 같은 속성을 포함합니다.
Rectangle 클래스의 면적 및 둘레를 알려주는 프로퍼티를 추가합니다. */

import 'dart:core';

import 'package:learn_dart_together/240607_inheritance/point.dart';

class Rectangle {
  double width;
  double height;
  Point topLeft;

  Rectangle({required this.width, required this.height, required this.topLeft});

  double area() {
    return width * height;
  }

  double perimeter() {
    return 2 * (width + height);
  }
}
