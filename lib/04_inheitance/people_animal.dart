//사람과 동물

class Animal {
//Animal 클래스를 만들고 type, sound와 같은 속성을 포함합니다.
  String type;
  String sound;

  Animal(
    this.type,
    this.sound,
  );
}

//Dog, Cat 및 Bird와 같은 Animal 클래스의 하위 클래스를 만듭니다.
class Dog extends Animal {
  Dog(
    super.type,
    super.sound,
  );

  void barks() {
    print('멍멍');
  }
//각 하위 클래스에 고유한 속성 및 메서드를 추가합니다.
}

class Cat extends Animal {
  Cat(
    super.type,
    super.sound,
  );

  void meow() {
    print('야옹');
  }
}
