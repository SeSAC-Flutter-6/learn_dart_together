class Animal {
  String type;
  String sound;

  Animal({required this.type, required this.sound});

  void eat() {
    print('먹는다');
  }

  void makeSound() {
    print('울음소리 $sound를 낸다');
  }
}
