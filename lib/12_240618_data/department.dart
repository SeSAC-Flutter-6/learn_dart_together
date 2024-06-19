import 'package:learn_dart_together/12_240618_data/employee.dart';

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader.toJson(),
      };

  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(
          json['leader'],
        );
  Department copyWith({
    String? name,
    Employee? leader,
  }) {
    return Department(
      name: name ?? this.name,
      leader: leader ?? this.leader,
    );
  }

  @override
  String toString() {
    return 'Department{name=$name, leader=$leader}';
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
}
