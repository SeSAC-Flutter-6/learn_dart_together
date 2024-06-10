import 'package:learn_dart_together/240607_inheritance/car.dart';
import 'package:learn_dart_together/240607_inheritance/motorcycle.dart';
import 'package:learn_dart_together/240607_inheritance/truck.dart';

class Vehicle {
  String maker;
  String model;
  int year;

  Vehicle(this.maker, this.model, this.year);

  void sound() {
    print('두두두두두두둥');
  }
}
