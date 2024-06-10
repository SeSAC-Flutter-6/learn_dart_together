
class Vehicle {
  VehicleMaker maker;
  String model;
  int year;

  Vehicle({
    required this.maker,
    required this.model,
    required this.year
  });
}

class VehicleMaker {
  String name;

  VehicleMaker(this.name);
}