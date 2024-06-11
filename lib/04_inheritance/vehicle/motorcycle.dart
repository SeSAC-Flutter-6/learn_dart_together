import 'package:learn_dart_together/04_inheritance/vehicle/vehicle.dart';

class Motorcycle extends Vehicle {
  String type;

  Motorcycle({
    required super.maker,
    required super.model,
    required super.year,
    required this.type,
  });

  @override
  void move() {
    super.move();
    print('부와앙');
  }
}
