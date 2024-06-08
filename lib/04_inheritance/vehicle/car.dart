import 'package:learn_dart_together/04_inheritance/vehicle/vehicle.dart';

class Car extends Vehicle {
  bool is4WD = true;

  Car(super.model, super.marker, super.year, this.is4WD);

  @override
  void sound() {
    print('부릉부릉');
  }
}
