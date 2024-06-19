import 'package:learn_dart_together/09_exception_file_data/json/employee.dart';

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader.toJson(),
      };

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Department &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          leader == other.leader;

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;

  Department copyWith(String? name, Employee? leader) {
    return Department(
      name: name ?? this.name,
      leader: leader ?? this.leader,
    );
  }
}
