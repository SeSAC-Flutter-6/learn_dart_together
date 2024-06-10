import 'package:learn_dart_together/04_Inheritance/vehicle/vehicle.dart';

class Car extends Vehicle {
  Car({
    required super.maker,
    required super.model,
    required super.year
  });
}