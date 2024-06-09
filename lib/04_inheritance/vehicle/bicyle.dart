import 'package:learn_dart_together/04_inheritance/vehicle/vehicle.dart';

class Bicycle extends Vehicle {
  int numberOfGears;

  Bicycle(
      {required super.maker,
      required super.model,
      required super.year,
      required this.numberOfGears});

  void changeGear(int gearLevel) {
    numberOfGears = gearLevel;
    print('기어를 $gearLevel단으로 변경했습니다');
  }
}
