import 'dart:io';
import 'package:learn_dart_together/11_json/employee_department.dart';
import 'package:test/test.dart';

void main() {
  test('employee department test', () {
    companyInformation('총무부','홍길동', 41);
    File company = File('lib/11_json/company.txt');
    final companyRead = company.readAsStringSync();
    expect(companyRead, equals('{name: 총무부, leader: Employee{name: 홍길동, age: 41}}'));
  });
}