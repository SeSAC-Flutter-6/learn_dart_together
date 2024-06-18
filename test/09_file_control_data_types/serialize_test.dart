import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:learn_dart_together/09_3_data_types/department.dart';
import 'package:learn_dart_together/09_3_data_types/employee.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('serialize test', () {
    test('직렬화, 역직렬화 동등성 테스트', () {
      final hongGilDong = Employee(name: '홍길동', age: 41);
      final originalDept = Department(name: '총무부', leader: hongGilDong);

      final companyFile  = File('lib/09_3_data_types/company.txt');
      final encodedDept = jsonEncode(originalDept.toJson());
      companyFile.writeAsStringSync(encodedDept);

      final copiedFile = companyFile.readAsStringSync();
      final decodedDept = Department.fromJson(jsonDecode(copiedFile));

      expect(decodedDept, originalDept);
    });
  });
}