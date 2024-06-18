import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/09_3_data_type/department.dart';
import 'package:learn_dart_together/09_3_data_type/employee.dart';
import 'package:test/test.dart';

void main() {
  group('data_type test', () {
    test('직렬화, 역직렬화 테스트', () {
      Employee administrationLeader = Employee(name: '홍길동', age: 41);
      Department administrationDept =
          Department(name: '총무부', leader: administrationLeader);

      //JSON으로 직렬화하여 파일에 쓰기
      String filePath = 'test/09_3_data_type/company.txt';
      File file = File(filePath);
      String administrationDeptJson = jsonEncode(administrationDept.toJson());
      file.writeAsStringSync(administrationDeptJson);

      // 파일에서 JSON 데이터를 읽어서 역직렬화
      String fileContent = file.readAsStringSync();
      Map<String, dynamic> json = jsonDecode(fileContent);
      Department deserializedAdministrationDept = Department.fromJson(json);

      expect(administrationDept == deserializedAdministrationDept, true);
    });
  });
}
