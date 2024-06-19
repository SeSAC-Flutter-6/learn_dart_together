import 'dart:convert';
import 'dart:io';
import 'package:learn_dart_together/11_json/employee_department.dart';
import 'package:test/test.dart';

void main() {
  test('employee department test', () {
    final department =
        Department(name: '총무부', leader: Employee(name: '홍길동', age: 41));
    final String target = 'lib/11_json/company_test.txt';
    companyInformation(department, target);
    final File company = File(target);
    final companyRead = company.readAsStringSync();
    print(department);
    print(Department.fromJson(jsonDecode(companyRead)));
    expect(Department.fromJson(jsonDecode(companyRead)), equals(department));
  });
}
