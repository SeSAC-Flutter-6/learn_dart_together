import 'package:learn_dart_together/inheritance/vehicle/vehicle.dart';

class ElectricCar extends Vehicle {
  int maxKm;
  int chargingTime;

  ElectricCar({
    required super.maker,
    required super.model,
    required super.year,
    required this.maxKm,
    required this.chargingTime,
  });

  @override
  void vehicleInfo() {
    super.vehicleInfo();
    print('특징: 전기차');
  }

  void travelDistance() {
    print('풀 충전시 $chargingTime분 걸리며, 최대 $maxKm km 운행 가능합니다.');
  }
}
