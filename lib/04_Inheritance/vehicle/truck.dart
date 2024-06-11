import 'package:learn_dart_together/04_Inheritance/vehicle/vehicle.dart';

class Truck extends Vehicle {
  Truck({
    required super.maker,
    required super.model,
    required super.year
  });

  @override
  void driveSound() {
    print("트럭 굴러가는 소리");
  }
}