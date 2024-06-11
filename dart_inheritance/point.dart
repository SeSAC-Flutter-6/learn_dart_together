class Point {
  int _x;
  int _y;

  Point(this._x, this._y);

  set y(int value) {
    _y = value;
  }

  set x(int value) {
    _x = value;
  }
}

class Rectangle {
  int _width;
  int _height;
  Point _topLeftPointer;

  Rectangle(this._width, this._height, Point topLeftPointer)
      : _topLeftPointer = topLeftPointer;

  int get width => _width;

  int get height => _height;

  int get area => _width * _height;

  int get perimeter => 2 * (_width + _height);

  set topLeftPointer(Point point) {
    _topLeftPointer = point;
  }
}

void main() {
  Point topLeft = Point(0, 0);

  Rectangle rectangle = Rectangle(10, 20, topLeft);

  print(rectangle.width);
  print(rectangle.height);
  print(rectangle.area);
  print(rectangle.perimeter);

  topLeft = Point(5, 5);
  rectangle._topLeftPointer = topLeft;
}
