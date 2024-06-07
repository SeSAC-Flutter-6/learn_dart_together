import 'package:learn_dart_together/05_inheritance/vehicle/vehicle.dart';

class Car extends Vehicle {
  Car({required super.maker, required super.model, required super.year});

  void openSunRook() {
    print('선루프를 열었습니다.');
  }
}
