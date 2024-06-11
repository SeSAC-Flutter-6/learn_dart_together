import 'package:learn_dart_together/04_240607_inheritance/animal.dart';

class Bird extends Animal {
  Bird(String type, String sound) : super(type, sound);

  @override
  void move() {
    print('두발로 걷기');
  }

  void sing() {
    print('꺄약꺄약');
  }
}
