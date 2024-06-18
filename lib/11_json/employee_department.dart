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

  Department(this.name, this.leader);

  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = json['leader'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader,
      };

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }
}

void companyInformation(String departureName, String name, int age) {
  final Employee employee = Employee(name: name, age: age);
  final Department department = Department(departureName, employee);
  final departmentString = department.toJson().toString();
  File company = File('lib/11_json/company.txt');
  company.writeAsStringSync(departmentString);
}
