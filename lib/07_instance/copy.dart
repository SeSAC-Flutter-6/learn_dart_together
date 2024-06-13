void main() {
  final person1 = Person('name', 50);
  final person2 = Person(person1.name, person1.age);

  print(person1 == person2);
}

class Person {
  String name;
  int age;

  Person(
    this.name,
    this.age,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Person &&
            runtimeType == other.runtimeType &&
            name == other.name &&
            age == other.age;
  }
}

// Person copyWith({
//   String? name,
//   int? age,
// }) {
//   return Person(
//     name: name ?? this.name,
//     age: age ?? this.age,
//   );
// }

bool operator(Object other) {
  return identical(this, other) ||
    other is Person && runtimeType == other.runtimeType
      && name == other.name
      && hp == other.hp;


}