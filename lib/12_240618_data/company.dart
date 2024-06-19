import 'dart:convert';
import 'dart:io';

import 'employee.dart';
import 'department.dart';

void main() {
  Employee employee = Employee(name: '홍길동', age: 41);
  Department department = Department(name: '총무부', leader: employee);
  print(
      'department $department'); //department Department{name=총무부, leader=Employee(name: 홍길동, age: 41)}
  final departmentJson = department.toJson();
  print('Department to JSON: $departmentJson');

  String jsonString = jsonEncode(departmentJson);
  print('JSON String: $jsonString');

  final sourceFile = File('company.txt');
  sourceFile.writeAsStringSync(jsonString);
}
