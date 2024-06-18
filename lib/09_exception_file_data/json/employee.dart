class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  @override
  String toString() {
    return 'Emplyoee{name: $name, age: $age}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  Employee copyWith(String? name, int? age) {
    return Employee(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
