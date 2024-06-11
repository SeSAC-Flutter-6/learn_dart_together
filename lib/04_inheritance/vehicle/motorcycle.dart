import 'package:learn_dart_together/04_inheritance/vehicle/vehicle.dart';

class Motorcycle extends Vehicle {
  String safetyEquipment = '헬멧';

  Motorcycle(super.model, super.marker, super.year, this.safetyEquipment);

  @override
  void sound() {
    print('부아아앙');
  }

  void work() {
    print('배달중');
  }
}
