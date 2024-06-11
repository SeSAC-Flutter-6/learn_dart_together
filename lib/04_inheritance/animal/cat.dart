import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Cat extends Animal {
  String breed;

  Cat({
    required this.breed,
    required super.sound,
  }) : super(type: AnimalType.mammal);

  void doGrooming() {
    print('그르밍을 합니다');
  }
}
