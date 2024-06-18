import 'dart:io';

import 'package:learn_dart_together/13_data_format/department.dart';
import 'package:learn_dart_together/13_data_format/employee.dart';

void main() {
  // Employee employee = Employee(name: '홍길동', age: 41);
  introduce('홍길동', 41, '총무부');
}

void introduce(String name, int age, String departmentName) {
  Employee employee = Employee(name: name, age: age);
  Department department = Department(name: departmentName, leader: employee);
  File file = File('lib/13_data_format/company.txt');

  final text = department.toJson().toString();
  file.writeAsStringSync(text);
}
