class Animal {
  AnimalType type;
  String sound;

  Animal({
    required this.type,
    required this.sound,
  });

  void makeSound() {
    print(sound);
  }

  void checkType() {
    switch (type) {
      case AnimalType.mammal:
        print('포유류입니다');
        break;
      case AnimalType.bird:
        print('조류입니다');
        break;
      case AnimalType.fish:
        print('어류입니다');
        break;
      case AnimalType.amphibian:
        print('양서류입니다');
        break;
      case AnimalType.reptile:
        print('파충류입니다');
        break;
      default:
        print('알 수 없는 동물 유형입니다');
    }
  }
}

enum AnimalType {
  mammal, // 포유류
  bird, // 조류
  fish, // 어류
  amphibian, // 양서류
  reptile, // 파충류
}
