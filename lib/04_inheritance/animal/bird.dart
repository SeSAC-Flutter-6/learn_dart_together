import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Bird extends Animal {
  bool _isFlying = false;

  Bird({required super.sound}) : super(type: AnimalType.bird);

  void fly() {
    if (_isFlying) {
      print('이미 비행중입니다');
    }
    _isFlying = true;
    print('비행 시작!');
  }
}
