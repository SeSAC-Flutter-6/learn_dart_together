class Vehicle {
  String _maker;
  String _model;
  int _year;

  Vehicle(this._maker, this._model, this._year);

  String get maker => _maker;
  String get model => _model;
  int get year => _year;
}

class Truck extends Vehicle {
  String _type;
  int _cargoCapacity;

  Truck(String maker, String model, int year, this._type, this._cargoCapacity)
      : super(maker, model, year);

  String get type => _type;
  int get cargoCapacity => _cargoCapacity;
}

class Car extends Vehicle {
  String _type;
  int _passengerCapacity;

  Car(String maker, String model, int year, this._type, this._passengerCapacity)
      : super(maker, model, year);

  String get type => _type;
  int get passengerCapacity => _passengerCapacity;
}

class Motorcycle extends Vehicle {
  String _type;
  int _maxSpeed;

  Motorcycle(String maker, String model, int year, this._type, this._maxSpeed)
      : super(maker, model, year);

  String get type => _type;
  int get maxSpeed => _maxSpeed;
}
