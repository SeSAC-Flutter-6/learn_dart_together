import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
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

  Employee copyWith({
    String? name,
    int? age,
  }) {
    return Employee(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Department &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          leader == other.leader;

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }

  Department copyWith({
    String? name,
    Employee? leader,
  }) {
    return Department(
      name: name ?? this.name,
      leader: leader ?? this.leader,
    );
  }
}

void main() {
  Employee employee = Employee(name: '홍길동', age: 41);
  Department department = Department(name: '총무부', leader: employee);

  String jsonData = jsonEncode(department);

  File file = File('company.txt');
  file.writeAsStringSync(jsonData);
  final text = file.readAsStringSync();
  print(text);
}
