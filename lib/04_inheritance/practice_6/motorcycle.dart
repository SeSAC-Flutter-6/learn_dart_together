import 'car.dart';

class Motorcycle extends Car {
  Motorcycle({
    required super.wheel,
    required super.engine,
    required super.maker,
    required super.model,
    required super.year,
  });

  void boost() {
    print('부스터를 가동합니다');
  }
}
