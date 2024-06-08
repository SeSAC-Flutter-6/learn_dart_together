import 'package:learn_dart_together/inheritance/animal/animal.dart';

class Dog extends Animal {
  String breed;

  Dog({required super.type, required super.sound, required this.breed});

  void checkBreed() {
    print('$type 품종은 $breed 입니다.');
  }
}

