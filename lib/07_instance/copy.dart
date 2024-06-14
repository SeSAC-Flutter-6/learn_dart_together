void main() {
  final person1 = Person(name:'name', age: 100);
  final person2 = Person(name:person1.name, age: person1.age);

  final person3 = person1.copyWith();
  print(person3 == person1);

  final person4 = person1.copyWith(name: '홍길동');
  print(person4);

  final person5 = person1.copyWith(age: 50);
  print(person4);
}

class Person {
  String name;
  int age;

  Person({
    required this.name,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age;

  Person copyWith({
    String? name,
    int? age
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age
    );
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;


  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }
}