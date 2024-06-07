class Person {
  final String name;
  final int birthYear;

  int get age => DateTime.now().year - birthYear;

  Person({required this.name, required this.birthYear});
}

void main() {
  Person person = Person(name: '홍길동', birthYear: 1980);
  print(person.age);
}
