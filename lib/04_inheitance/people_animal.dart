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
  String smell; //후각
  String loyalty; //충성심

  Dog(
    super.type,
    super.sound,
    this.smell,
    this.loyalty,
  );

  void barks() {
    print('멍멍');
  }

  void playInstinct() {
    print('꼬리치며 놀아달라고 하고 있다');
  }

  void learning() {
    print('고개를 갸우뚱하며 배우려 하고 있다');
  }
//각 하위 클래스에 고유한 속성 및 메서드를 추가합니다.
}

class Cat extends Animal {
  String flexibility; //유연성
  String claws; //발톱

  Cat(
    super.type,
    super.sound,
    this.flexibility,
    this.claws,
  );

  void meow() {
    print('야옹');
  }

  void clawsHidden() {
    print('발톱 숨기기를 시전했다');
  }

  void grooming() {
    print('혀로 몸을 씻는다');
  }
}

class Bird extends Animal {
  String fly; //날개
  String beak; //부리
  String claws; //발톱

  Bird(
    super.type,
    super.sound,
    this.fly,
    this.beak,
    this.claws,
  );

  void attackBeak() {
    print('부리로 공격한다');
  }

  void clawsGrab() {
    print('나뭇가지를 잡고 서있다');
  }
}
