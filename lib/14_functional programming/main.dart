void main() {
  List<int> list = [1, 2, 3];

  List<int> sumList = list + [4, 5];

  final Iterable<int> filteredList = list.where((e) => e % 2 == 0);

  Person p1 = Person();
  Person p2 = Person();
  Person p3 = p1 + p2;

}

class Person {
  Person operator +(Person other) {
    return Person();
  }
}