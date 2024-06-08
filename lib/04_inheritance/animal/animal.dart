class Animal {
  String type;
  String sound;

  Animal(this.type, this.sound);

  void crying() {
    print('$type가 $sound 소리를 내고 있습니다');
  }
}
