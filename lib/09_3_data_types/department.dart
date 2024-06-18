import 'package:learn_dart_together/09_3_data_types/employee.dart';

class Department {
  String name;
  Employee leader;

  Department({
    required this.name,
    required this.leader,
  });

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);

  @override
  int get hashCode => Object.hash(name, leader);

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is Department &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      leader == other.leader;

  @override
  String toString() =>
      'Department{name: $name, leader: $leader}';

  Map<String, dynamic> toJson() =>
      {'name': name, 'leader': leader.toJson()};

  Department copyWith(String? name, Employee? leader) =>
      Department(name: name ?? this.name, leader: leader ?? this.leader);
}