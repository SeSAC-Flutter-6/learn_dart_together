class Person {
  String name;

  Person({required this.name});
}

void main() {
  List<Person> list = [];
  Person person1 = Person(name: '홍길동');
  Person person2 = Person(name: '한석봉');
  list.add(person1);
  list.add(person2);
  list.map((e) => e.name).toList().forEach(print);
}
