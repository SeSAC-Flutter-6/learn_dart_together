import 'package:learn_dart_together/04_Inheritance/vehicle/vehicle.dart';

class Motorcycle extends Vehicle {
  Motorcycle({
    required super.maker,
    required super.model,
    required super.year
  });

  @override
  void driveSound() {
    print('오토바이 굴러가는 소리');
  }
}