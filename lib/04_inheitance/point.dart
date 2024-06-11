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
class Rectangle {
  double width; //넓이
  double height; //높이
  Point topLeft; // 왼쪽 위에 점

  //Rectangle 클래스의 면적 및 둘레를 알려주는 프로퍼티를 추가합니다.
  //double get point => super.x * super.y;// topleft 포인트 위치 계산
  double get area => width * height; //면적계산 프로퍼티
  double get parameter => 2 * (width + height); //둘레계산 프로퍼티

  Rectangle(

    this.width,
    this.height,
    this.topLeft,
  );
}
