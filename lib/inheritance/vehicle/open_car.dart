import 'package:learn_dart_together/inheritance/vehicle/vehicle.dart';

class OpenCar extends Vehicle {
  int openSeconds;

  OpenCar({
    required super.maker,
    required super.model,
    required super.year,
    required this.openSeconds,
  });

  @override
  void vehicleInfo() {
    super.vehicleInfo();
    print('특징: 오픈카');
  }

  void openDelay() {
    print('30km 이하 속도에서 오픈까지 $openSeconds초 걸립니다.');
  }
}
