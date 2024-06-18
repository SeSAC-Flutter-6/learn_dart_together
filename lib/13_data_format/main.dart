import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/13_data_format/department.dart';
import 'package:learn_dart_together/13_data_format/employee.dart';

void main() {
  String jsonString = '{"name":"총무부","leader":{"name":"홍길동","age":41}}';
  Map<String, dynamic> json = jsonDecode(jsonString);
  print(Department.fromJson(json));
  // introduce('홍길동', 41, '총무부');

  final map = {
    'name': '총무부',
    'leader': {
      'name': '홍길동',
      'age': 41,
    }
  };
}

void introduce(String name, int age, String departmentName) {
  Employee employee = Employee(name: name, age: age);
  Department department = Department(name: departmentName, leader: employee);
  File file = File('lib/13_data_format/company.txt');

  final text = jsonEncode(department.toJson());
  file.writeAsStringSync(text);
}
