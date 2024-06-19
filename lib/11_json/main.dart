import 'dart:convert';
import 'dart:io';
import 'package:learn_dart_together/11_json/department.dart';
import 'package:learn_dart_together/11_json/employee.dart';

void main() {
  final gildong = Employee('홍길동', 41);
  final admin = Department('총무부', gildong);

  final companyFile = File('company3.txt');
  final encodedAdmin = jsonEncode(admin.toJson());
  companyFile.writeAsStringSync(encodedAdmin);
}
