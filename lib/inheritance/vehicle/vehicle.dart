import 'package:learn_dart_together/inheritance/vehicle/electric_car.dart';
import 'package:learn_dart_together/inheritance/vehicle/open_car.dart';
import 'package:learn_dart_together/inheritance/vehicle/truck.dart';

class Vehicle {
  String maker;
  String model;
  int year;

  Vehicle({
    required this.maker,
    required this.model,
    required this.year,
  });

  void vehicleInfo() {
    print('탈 것 정보 \nmaker: $maker \nmodel: $model \n연식: $year');
  }
}

void main() {
  Vehicle vehicle = Vehicle(maker: '테슬라', model: '모델Y', year: 2022);
  vehicle.vehicleInfo();
  OpenCar openCar = OpenCar(maker: '벤츠', model: 'E220d', year: 2024, openSeconds: 30);
  openCar.vehicleInfo();
  Truck truck = Truck(maker: '볼보', model: '1톤 화물차', year: 2018, cargoBox: 1);
  truck.vehicleInfo();
  ElectricCar electricCar = ElectricCar(maker: '포르쉐', model: '타이칸', year: 2024, maxKm: 500, chargingTime: 90);
  electricCar.travelDistance();

}
