import 'package:learn_dart_together/04_Inheritance/animal/animal.dart';

class Cat extends Animal {

  Cat(super.type, super.sound);

  @override
  void say() {
    super.say();
    print('라고 고양이가 말했다.');
  }
}