import 'dart:io';
import 'package:test/test.dart';
import 'package:learn_dart_together/11_json/practice/department.dart';
import 'package:learn_dart_together/11_json/practice/employee.dart';
import 'package:learn_dart_together/11_json/practice/from_json_file.dart';
import 'package:learn_dart_together/11_json/practice/to_json_file.dart';

void main() {
  group('toJsonFile 및 fromJsonFile 함수 테스트', () {
    test('toJsonFile 실행시, 기존 데이터가 json 데이터로 잘 변환되었는지 확인한다', () {
      Department testDepartment = Department('테스트부', Employee('테스트직원', 30));
      String testFilePath =
          '${Directory.current.path}/test/11_json/test_company.txt';

      toJsonFile(testDepartment, testFilePath);
      String fileContent = File(testFilePath).readAsStringSync();

      expect(fileContent,
          equals('{"name":"테스트부","leader":{"name":"테스트직원","age":30}}'));
    });

    test('fromJsonFile 실행시, json 데이터가 Map 형태로 변환되었는지 확인한다', () {
      String testFilePath =
          '${Directory.current.path}/test/11_json/test_company.txt';

      Department testDepartment = fromJsonFile(testFilePath);

      expect(testDepartment.name, equals('테스트부'));
      expect(testDepartment.leader.name, equals('테스트직원'));
      expect(testDepartment.leader.age, equals(30));
    });
  });
}
