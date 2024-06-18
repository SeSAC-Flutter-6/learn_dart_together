import 'package:learn_dart_together/09_3_data_type/employee.dart';

class Department {
  String name;
  Employee leader;

  Department({
    required this.name,
    required this.leader,
  });

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
    return 'Employee{name: $name, age: $leader}';
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'leader': leader.toJson(),
    };
  }

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      name: json['name'],
      leader: Employee.fromJson(json['leader']),
    );
  }
}
