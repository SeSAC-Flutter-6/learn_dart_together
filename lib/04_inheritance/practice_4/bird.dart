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

  @override
  void makeSound() {
    print('$this.sound 지저귄다');
  }

  void fly() {
    print('날다');
  }
}
