class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

void main() {
  List<Person> list = [];
  Map<String, int> map = {};
  Person person1 = Person(name: '홍길동', age: 20);
  Person person2 = Person(name: '한석봉', age: 21);
  list.add(person1);
  list.add(person2);
  list.map((e) => e.name).toList().forEach(print);
  for (int i = 0; i < list.length; i++) {
    map[list[i].name] = list[i].age;
  }
  for (int i = 0; i < map.length; i++) {
    print('${map.keys.elementAt(i)}의 나이는 ${map.values.elementAt(i)}살');
  }
}
