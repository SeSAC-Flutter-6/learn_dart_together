import 'package:learn_dart_together/04_Inheritance/animal/animal.dart';

enum HairType {
  long, short
}

class Cat extends Animal {
  HairType hairType;

  Cat({
    required super.type,
    required super.sound,
    required this.hairType
  });

  @override
  void say() {
    super.say();
    print('라고 고양이가 말했다.');
  }

  void haack() {
    print('하아앜!!');
  }
}