import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Dog extends Animal {
  String breed;

  Dog({required this.breed, required super.sound})
      : super(type: AnimalType.mammal);

  void goForWalk() {
    //산책하기
    print('산책을 합니다');
  }
}
