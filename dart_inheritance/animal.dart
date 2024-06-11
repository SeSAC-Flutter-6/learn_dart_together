class Animal {
  String _type;
  String _sound;

  Animal(this._type, this._sound);

  // String get type => _type;
  //
  // String get sound => _sound;

  void set type(String type) {
    _type = type;
  }

  void set sound(String sound) {
    _sound = sound;
  }
}

class Dog extends Animal {
  bool _isLongHair;

  Dog(String type, String sound, bool isLongHair)
      : _isLongHair = isLongHair,
        super(type, sound);

  bool get isLongHair => _isLongHair;

  void set isLongHair(bool isLongHair) {
    _isLongHair = isLongHair;
  }

  void run(int speed) {
    print('개가 $speed의 속도로 달립니다');
  }
}

class Cat extends Animal {
  String _eyeColor;

  Cat(String type, String sound, String eyeColor)
      : _eyeColor = eyeColor,
        super(type, sound);

  String get eyeColor => _eyeColor;

  void set eyeColor(String eyeColor) {
    _eyeColor = eyeColor;
  }

  void treeClimbing(int height) {
    print('고양이가 $height 높이 만큼 나무를 오릅니다');
  }
}

class Bird extends Animal {
  bool _aggression;

  Bird(String type, String sound, bool aggression)
      : _aggression = aggression,
        super(type, sound);

  bool get aggression => _aggression;

  void set aggression(bool aggression) {
    _aggression = aggression;
  }

  void flying() {
    print('새가 날아갑니다');
  }
}
