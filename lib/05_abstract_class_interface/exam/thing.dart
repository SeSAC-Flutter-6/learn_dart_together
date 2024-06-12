abstract interface class Thing {
  double get weight;

  set weight(double value);
}

abstract interface class A {}

abstract interface class B {}

class Dog implements A {}

class Desk implements A, B {}

void main() {
  List<A> list = [Dog(), Desk()];
}
