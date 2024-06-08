import 'package:learn_dart_together/04_inheritance/vehicle/vehicle.dart';

class Car extends Vehicle {
  String engine;

  Car({
    required super.maker,
    required super.model,
    required super.year,
    required this.engine,
  });

  @override
  void move() {
    super.move();
    print('부릉부릉');
  }
}
