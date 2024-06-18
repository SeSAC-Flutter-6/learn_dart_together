import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/09_3_data_types/department.dart';
import 'package:learn_dart_together/09_3_data_types/employee.dart';

void main() {
  Employee hongGilDong = Employee(name: '홍길동', age: 41);
  Department adminDept = Department(name: '총무부', leader: hongGilDong);

  // Department 객체를 직렬화.
  final String jsonString = jsonEncode(adminDept.toString());

  // 경로에 company.txt 파일 생성
  final File companyFile = File('lib/09_3_data_types/company.txt');

  // 생성한 company.txt 파일에 직렬화된 json 문자열 쓰기
  companyFile.writeAsStringSync(jsonString);
}