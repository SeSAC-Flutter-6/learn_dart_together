import 'dart:convert';
import 'dart:io';

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

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;
}

class Department {
  String name;
  Employee leader;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Department &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          leader == other.leader;

  // Department(this.name, this.leader);
  Department({
    required this.name,
    required this.leader,
  });

  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']); //json['leader'] 자체가 map

  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader.toJson(),
      };

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }
}

void companyInformation(Department department, String target) {
  final departmentString = jsonEncode(department.toJson());

  File company = File(target);
  company.writeAsStringSync(departmentString);
}
