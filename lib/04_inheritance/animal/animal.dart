abstract class Animal {
  MoveType get type; // 2족보행, 4족보행
  String get sound; // 울음 소리

  void makeSound();
}

enum MoveType {
  walking,
  flying,
}
