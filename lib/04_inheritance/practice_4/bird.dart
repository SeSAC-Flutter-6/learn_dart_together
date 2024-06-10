import 'animal.dart';

class Bird extends Animal {
  bool? hasSpots;
  String? beakColor;
  String? color;

  Bird({
    required super.type,
    required super.sound,
    this.hasSpots,
    this.beakColor,
    this.color,
  });

  void fly() {
    print('날다');
  }
}
