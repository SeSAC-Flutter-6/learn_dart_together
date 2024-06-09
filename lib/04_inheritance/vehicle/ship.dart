import 'package:learn_dart_together/04_inheritance/vehicle/vehicle.dart';

class Ship extends Vehicle {
  bool isDocked;

  Ship(
      {required super.maker,
      required super.model,
      required super.year,
      this.isDocked = true});

  void dock() {
    if (!isDocked) {
      isDocked = true;
      print('배를 정박합니다');
    }
  }

  void depart() {
    if (isDocked) {
      isDocked = false;
      print('배를 출항합니다');
    }
  }
}
