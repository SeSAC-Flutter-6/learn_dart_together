class Employee {
  String name;
  int age;

  Employee({
    required this.name,
    required this.age,
  });

  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  @override
  int get hashCode => Object.hash(name, age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Employee &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age;

  @override
  String toString() =>
      'Employee{name: $name, age: $age}';

  Map<String, dynamic> toJson() =>
      {'name': name, 'age': age};

  Employee copyWith(String? name, int? age) =>
      Employee(name: name ?? this.name, age: age ?? this.age);
}