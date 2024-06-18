import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/09_exception_file_data/json/employee.dart';

import 'department.dart';

void main() {
  Employee gildong = Employee(name: '홍길동', age: 41);
  Department administrationDept = Department(name: '총무부', leader: gildong);

  final jsonString = jsonEncode(administrationDept.toJson());
  final companyFile = File('company.txt');
  companyFile.writeAsStringSync(jsonString);
}
