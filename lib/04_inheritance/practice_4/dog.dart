import 'animal.dart';

class Dog extends Animal {
  bool? hasSpots;
  String? color;

  Dog({
    required super.type,
    required super.sound,
    this.hasSpots,
    this.color,
  });

  @override
  void makeSound() {
    print('$this.sound 짖는다');
  }

  void wagTail() {
    print('꼬리를 흔든다');
  }
}
