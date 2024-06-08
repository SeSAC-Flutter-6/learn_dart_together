import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Cat extends Animal {
  String color;

  Cat({
    required super.sound,
    required super.type,
    required this.color,
  });

  @override
  void talk() {
    print('$sound 울기');
  }

  void purr() {
    print('골골송 부르기');
  }
}
