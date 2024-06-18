import 'package:learn_dart_together/11_json/employee.dart';

class Department {
  String name;
  Employee leader;

  Department(
    this.name,
    this.leader,
  );

  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader.toJson(),
      };

  Department copyWith({
    String? name,
    Employee? leader,
  }) {
    return Department(
      name ?? this.name,
      leader ?? this.leader,
    );
  }

  @override
  String toString() => 'Department(name: $name, leader: $leader)';

  @override
  bool operator ==(covariant Department other) {
    if (identical(this, other)) return true;
    return other.name == name && other.leader == leader;
  }

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;
}
