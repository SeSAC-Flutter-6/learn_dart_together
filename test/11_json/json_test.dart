import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/11_json/department.dart';
import 'package:learn_dart_together/11_json/employee.dart';
import 'package:test/test.dart';

void main() {
  test('직렬화한 데이터를 다시 역직렬화 했을 때 해당 데이터와 일치해야함', () {
    final gildong = Employee('홍길동', 41);
    final admin = Department('총무부', gildong);

    final companyFile = File('company.txt');
    final encodedAdmin = jsonEncode(admin.toJson());
    companyFile.writeAsStringSync(encodedAdmin);

    final content = companyFile.readAsStringSync();
    final decodedAdmin = Department.fromJson(jsonDecode(content));

    expect(decodedAdmin, admin);
  });
}
