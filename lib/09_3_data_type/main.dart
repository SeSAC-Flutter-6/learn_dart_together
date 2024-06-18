import 'dart:convert';
import 'dart:io';
import 'package:learn_dart_together/09_3_data_type/department.dart';
import 'package:learn_dart_together/09_3_data_type/employee.dart';

void main() {
  Employee administrationLeader = Employee(name: '홍길동', age: 41);
  Department administrationDept =
      Department(name: '총무부', leader: administrationLeader);

  String administrationDeptJson = jsonEncode(administrationDept.toJson());

  File file = File('lib/09_3_data_type/company.txt');
  file.writeAsStringSync(administrationDeptJson);
}
