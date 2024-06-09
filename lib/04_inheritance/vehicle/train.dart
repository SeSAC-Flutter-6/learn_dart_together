import 'package:learn_dart_together/04_inheritance/vehicle/vehicle.dart';

class Train extends Vehicle {
  int numberOfCars;
  Train(
      {required super.maker,
      required super.model,
      required super.year,
      required this.numberOfCars});

  void addCar(int count) {
    numberOfCars += count;
    print('기차를 $count칸 연장했습니다. 현재 기차 칸 수 : $numberOfCars');
  }
}
