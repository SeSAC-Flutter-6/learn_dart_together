import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Cat extends Animal {
  String hairLength; // short or long

  Cat({
    required super.sound,
    required super.type,
    required this.hairLength,
  });

  @override
  void talk() {
    print('$sound 울기');
  }

  void purr() {
    print('골골송 부르기');
  }
}
