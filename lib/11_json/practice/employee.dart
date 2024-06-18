class Employee {
  String name;
  int age;

  Employee(
    this.name,
    this.age,
  );

  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  Employee copyWith({
    String? name,
    int? age,
  }) {
    return Employee(
      name ?? this.name,
      age ?? this.age,
    );
  }

  @override
  String toString() => 'Emplyee(name: $name, age: $age)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
