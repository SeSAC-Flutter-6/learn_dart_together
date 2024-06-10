
import 'package:learn_dart_together/04_Inheritance/animal/animal.dart';

class Dog extends Animal {

  Dog(super.type, super.sound);

  @override
  void say() {
    super.say();
    print('라고 강아지가 말했다.');
  }
}