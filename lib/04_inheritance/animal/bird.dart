import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Bird extends Animal {
  bool hasWing;

  Bird(super.type, super.sound, this.hasWing);

  void flying() {
    print('그리고 새가 날아다니고 있습니다.');
  }

  @override
  void crying() {
    super.crying();
    flying();
  }
}
