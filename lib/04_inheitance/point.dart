  //Point 클래스를 만들고 x 및 y 좌표와 같은 속성을 포함합니다.
class Point {
  double x;
  double y;

  Point(
    this.x,
    this.y,
  );
}
  //Rectangle 클래스를 만들고 width, height, top-left 포인터와 같은 속성을 포함합니다.
class Rectangle extends Point {
  double width;
  double height;

  //Rectangle 클래스의 면적 및 둘레를 알려주는 프로퍼티를 추가합니다.
  double get top_Left => width * height;
  double get parameter => 2 * (width + height);

  Rectangle(
    super.x,
    super.y,
    this.width,
    this.height,
    );
}
