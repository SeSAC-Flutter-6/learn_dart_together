import 'animal.dart';

class Cat extends Animal {
  bool? hasSpots;
  String? color;

  Cat({
    required super.type,
    required super.sound,
    this.hasSpots,
    this.color,
  });

  @override
  void makeSound() {
    print('$this.sound 야옹한다');
  }

  void scratch() {
    print('할퀴기!');
  }
}
