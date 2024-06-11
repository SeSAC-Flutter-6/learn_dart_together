import 'package:learn_dart_together/05_inheritance/vehicle/vehicle.dart';

class Truck extends Vehicle {
  Truck({required super.maker, required super.model, required super.year});

  void loadCargo(int a) {
    print('$a만큼의 화물을 싣고 갔습니다..');
  }
}
