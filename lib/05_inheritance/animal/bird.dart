import 'package:learn_dart_together/05_inheritance/animal/animal.dart';

class Bird extends Animal {
  Bird({required super.type, required super.sound});

  void fly() {
    print('날고 있습니다.');
  }
}
