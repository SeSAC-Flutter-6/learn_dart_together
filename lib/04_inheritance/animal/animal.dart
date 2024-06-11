abstract class Animal {
  MoveType get type;
  String get sound;

  void makeSound();
}

enum MoveType {
  walking,
  flying,
}
