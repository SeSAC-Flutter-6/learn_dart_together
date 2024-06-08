import 'package:learn_dart_together/inheritance/vehicle/vehicle.dart';

class Truck extends Vehicle {
  double cargoBox; //적재량

  Truck({
    required super.maker,
    required super.model,
    required super.year,
    required this.cargoBox,
  });

  @override
  void vehicleInfo() {
    super.vehicleInfo();
    print('특징: 화물차');
  }

  void checkCargoBox() {
    print('이 트럭은 $cargoBox톤 까지 적재 가능합니다.');
  }
}
