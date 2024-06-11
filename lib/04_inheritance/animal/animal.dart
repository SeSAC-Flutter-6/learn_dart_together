class Animal {
  AnimalType type;
  String sound;

  Animal({
    required this.type,
    required this.sound,
  });

  void talk() {
    print('bla bla');
  }
}

enum AnimalType {
  mammals,
  birds,
  fish,
  reptiles,
  amphibians,
}
