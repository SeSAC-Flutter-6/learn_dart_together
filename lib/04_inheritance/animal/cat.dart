import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Cat extends Animal {
  bool isNocturnal;

  Cat({this.isNocturnal = true});

  void activePattern() {
    if (isNocturnal) print('밤마다 주인을 깨웁니다.');
    if (!isNocturnal) print('낮에 다른 고양이와 놉니다');
  }

  @override
  void makeSound() {
    print('고양이가 $sound하고 짖습니다');
  }

  @override
  String get sound => 'Meow';

  @override
  MoveType get type => MoveType.walking;
}
