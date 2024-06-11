import 'package:learn_dart_together/inheritance/animal/animal.dart';

class Bird extends Animal {
  bool canFly;

  Bird({required super.type, required super.sound, required this.canFly});

  void fly() {
    if (canFly) {
      print('$type는 날 수 있다.');
    } else {
      print('$type는 날 수 없다.');
    }
  }
}
