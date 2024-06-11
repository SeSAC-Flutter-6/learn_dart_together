import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Dog extends Animal {
  String breed;

  Dog({
    required super.sound,
    required super.type,
    required this.breed,
  });

  @override
  void talk() {
    print('$sound 짖기');
  }

  void walk() {
    print('산책하기');
  }
}
