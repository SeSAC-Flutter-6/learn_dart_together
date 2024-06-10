import 'package:learn_dart_together/04_Inheritance/vehicle/vehicle.dart';

class Car extends Vehicle {
  Car({
    required super.maker,
    required super.model,
    required super.year
  });

  @override
  void driveSound() {
    print('차 굴러가는 소리');
  }
}