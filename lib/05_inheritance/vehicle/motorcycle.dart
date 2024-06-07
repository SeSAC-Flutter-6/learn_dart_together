import 'package:learn_dart_together/05_inheritance/vehicle/vehicle.dart';

class Motorcycle extends Vehicle {
  Motorcycle({required super.maker, required super.model, required super.year});

  void popWheel() {
    print('앞바퀴를 들어올립니다.');
  }
}
