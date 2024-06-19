import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/13_data_format/department.dart';
import 'package:learn_dart_together/13_data_format/employee.dart';

void main() {
  // String jsonString = '{"name":"총무부","leader":{"name":"홍길동","age":41}}';
  // Map<String, dynamic> json = jsonDecode(jsonString);
  // print(Department.fromJson(json));
  // introduce(Department(name: '총무부', leader: Employee(name: '홍길동', age: 41)),
  //     'lib/13_data_format/company.txt');

  Employee employee = Employee(name: '홍길동', age: 41);
  print(employee.toJson().toString());
  print(jsonEncode(employee.toJson()));

  final map = {
    'name': '총무부',
    'leader': {
      'name': '홍길동',
      'age': 41,
    }
  };
}

void introduce(Department department, String target) {
  File file = File(target);
  final text = jsonEncode(department.toJson());
  file.writeAsStringSync(text);
}
