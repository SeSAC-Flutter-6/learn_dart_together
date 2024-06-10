import 'package:learn_dart_together/04_Inheritance/vehicle/vehicle.dart';

class Motorcycle extends Vehicle {
  Motorcycle({
    required super.maker,
    required super.model,
    required super.year
  });
}