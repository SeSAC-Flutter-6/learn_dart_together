// Animal 클래스를 만들고 type, sound와 같은 속성을 포함합니다.
// Dog, Cat 및 Bird와 같은 Animal 클래스의 하위 클래스를 만듭니다.
// 각 하위 클래스에 고유한 속성 및 메서드를 추가합니다.

void main() {}

class Animal {
  String type;
  String sound;

  Animal(this.type, this.sound);

  void move() {
    print('움직이다');
  }
}
