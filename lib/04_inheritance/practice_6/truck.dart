import 'car.dart';

class Truck extends Car {
  Truck({
    required super.wheel,
    required super.engine,
    required super.maker,
    required super.model,
    required super.year,
  });

  void load() {
    print('짐을 실었습니다');
  }

  void unload() {
    print('짐을 내렸습니다');
  }
}
