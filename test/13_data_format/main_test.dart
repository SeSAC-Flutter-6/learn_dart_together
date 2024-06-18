import 'dart:io';

import 'package:learn_dart_together/13_data_format/main.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('introduce() 메서드를 사용하면 json 형태로 company 파일에 저장된다. ', () {
    introduce('홍길동', 41, '총무부');
    File file = File('lib/13_data_format/company.txt');
    expect(file.readAsStringSync(),
        '{name: 총무부, leader: Employee{name: 홍길동, age: 41}}');
  });
}
