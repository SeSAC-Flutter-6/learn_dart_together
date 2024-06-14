import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Person {
  String name;
  int age;
  Animal pet;

  Person({
    required this.name,
    required this.age,
    required this.pet
  });

  @override
  String toString() {
    return '이름: $name, 나이: $age';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          pet == other.pet;
          
  @override
  int get hashCode => name.hashCode ^ age ^ pet.hashCode;
  
  Person copyWith({
    String? name,
    int? age,
    Animal? pet,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      pet: pet ?? this.pet
    );
  }
}
