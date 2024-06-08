import 'package:learn_dart_together/04_inheritance/vehicle/vehicle.dart';

class Truck extends Vehicle {
  int capacity;

  Truck({
    required super.maker,
    required super.model,
    required super.year,
    required this.capacity,
  });

  void load() {
    print('짐 싣기');
  }

  void unload() {
    print('짐 내리기');
  }
}

void main() {
  var a = Truck(maker: "", model: "", year: 123, capacity: 123);
  a.move();
}
