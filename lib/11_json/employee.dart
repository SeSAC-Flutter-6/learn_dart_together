class Employee {
  String name;
  int age;

  Employee(
    this.name,
    this.age,
  );

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
  String toString() => 'Employee(name: $name, age: $age)';

  @override
  bool operator ==(covariant Employee other) {
    if (identical(this, other)) return true;
    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
