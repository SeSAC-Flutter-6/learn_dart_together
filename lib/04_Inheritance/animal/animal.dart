class Animal {
  String type;
  String sound;

  Animal({
    required this.type,
    required this.sound
  });

  void say() {
    print(sound);
  }
}