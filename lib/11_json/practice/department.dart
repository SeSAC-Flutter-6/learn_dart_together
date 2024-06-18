// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Department &&
          other.runtimeType == runtimeType &&
          other.name == name &&
          other.leader == leader;

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;

  @override
  String toString() => 'Department(name: $name, leader: $leader)';
}
