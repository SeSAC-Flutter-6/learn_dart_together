abstract interface class Thing {
  set weight(double value);

  double get weight;
}

abstract interface class A {}

abstract interface class B {}

class Dog implements A {}

class Desk implements A {}

void main() {
  List<A> list = [Dog(), Desk()];
}
