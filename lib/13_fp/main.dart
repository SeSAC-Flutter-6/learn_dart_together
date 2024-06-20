void main() {
  List<int> list = [1, 2, 3];
  List<int> sum = list + [4, 5];

  final Iterable<int> filteredList = list.where((e) => e % 2 == 0);
}
class Person {
  Person operator + (Person other) {
    return Person();
  }
}