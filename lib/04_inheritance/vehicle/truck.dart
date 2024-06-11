import 'car.dart';

class Truck extends Car {
  bool isStick = true;

  Truck(super.model, super.marker, super.year, super.is4WD, this.isStick);

  @override
  void sound() {
    super.sound();
    print('(대충 기어 변속 소리)');
  }
}
