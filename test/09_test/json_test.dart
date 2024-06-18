import 'dart:io';

import 'package:learn_dart_together/09_exception_file_data/json/employee.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('company.txt test', () {
    final companyFile = File('company.txt');
    final jsonString = '{"name":"총무부","leader":{"name":"홍길동","age":41}}';

    expect(companyFile.readAsStringSync(), jsonString);
  });
}
