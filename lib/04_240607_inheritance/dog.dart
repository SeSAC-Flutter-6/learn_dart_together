import 'package:learn_dart_together/04_240607_inheritance/animal.dart';

class Dog extends Animal {
  Dog(String type, String sound) : super(type, sound);

  @override
  void move() {
    print('4발로 걷기');
  }

  void bark() {
    print('왈왈 짓기');
  }
}
