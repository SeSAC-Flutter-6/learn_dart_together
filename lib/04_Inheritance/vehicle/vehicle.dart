
class Vehicle {
  VehicleMaker maker;
  String model;
  int year;

  Vehicle({
    required this.maker,
    required this.model,
    required this.year
  });

  void driveSound() {
    print("탈 것 굴러가는 소리");
  }
}

class VehicleMaker {
  String name;

  VehicleMaker(this.name);
}