import 'dart:math';

enum RectanglePointer {
  topLeft, topRight, bottomLeft, bottomRight;
}

class Rectangle {
  int width;
  int height;

  int get area {
   return width * height;
  }

  int get round {
    return (width + height) * 2;
  }

  Rectangle(this.width, this.height);

  // Rectangle의 각 모서리 4군데의 좌표 값을 pointfh qksghksgksms gkatn
  Point getPoint({required RectanglePointer pointer}) {
    switch (pointer) {
      case RectanglePointer.topLeft:
        return Point(0, 0);
      case RectanglePointer.topRight:
        return Point(width, 0);
      case RectanglePointer.bottomLeft:
        return Point(0, height);
      case RectanglePointer.bottomRight:
        return Point(width, height);
    }
  }
}