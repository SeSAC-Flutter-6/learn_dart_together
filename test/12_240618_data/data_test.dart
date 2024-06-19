import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:learn_dart_together/12_240618_data/department.dart';
import 'package:learn_dart_together/12_240618_data/employee.dart';

void main() {
  test('data test', () {
    Employee leader = Employee(name: '홍길동', age: 41);
    Department department = Department(name: '총무부', leader: leader);
    final testText = department.toJson();
    String testString = jsonEncode(testText);
    final sourceFile = File('testCode.text');
    sourceFile.writeAsStringSync(testString);
    final sourcetext = sourceFile.readAsStringSync();
    final fileJson = jsonDecode(sourcetext);
    String departName = fileJson['name'];
    expect(departName, equals('총무부'));
  });
}
