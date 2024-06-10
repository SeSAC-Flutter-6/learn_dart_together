import 'package:learn_dart_together/240607_inheritance/vehicle.dart';

class Truck extends Vehicle {
  int horsePower;
  Truck(super.maker, super.model, super.year, this.horsePower);

  void move() {
    super.sound();
    print('트럭이 시동이 걸린 후 출발합니다');
  }

  void load() {
    print('10톤 이상 적재 가능합니다.');
  }
}
