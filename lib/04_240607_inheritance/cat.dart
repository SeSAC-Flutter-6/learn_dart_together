import 'package:learn_dart_together/04_240607_inheritance/animal.dart';

class Cat extends Animal {
  Cat(String type, String sound) : super(type, sound);

  @override
  void move() {
    print('네발로 걷기');
  }

  void meow() {
    print('미아우');
  }
}
