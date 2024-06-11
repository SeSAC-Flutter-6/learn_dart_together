import 'package:learn_dart_together/240607_inheritance/vehicle.dart';

class Motorcycle extends Vehicle {
  Motorcycle(super.maker, super.model, super.year);

  void move() {
    super.sound();
    print('오토바이 시동 걸린 후 출발합니다.');
  }
}
