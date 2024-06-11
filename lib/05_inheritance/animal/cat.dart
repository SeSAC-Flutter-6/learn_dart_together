import 'package:learn_dart_together/05_inheritance/animal/animal.dart';

class Cat extends Animal {
  Cat({required super.type, required super.sound});

  void scratch() {
    print('할퀴었습니다.');
  }
}
