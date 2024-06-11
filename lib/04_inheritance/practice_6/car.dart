import 'vehicle.dart';

class Car extends Vehicle {
  int wheel;
  String engine;

  Car({
    required this.wheel,
    required this.engine,
    required String maker,
    required String model,
    required int year,
  }) : super(maker, model, year);

  void accelerate() {
    print('가속합니다');
  }

  void stop() {
    print('멈춥니다');
  }
}
