import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/09_03_various_data_formats/training.dart';
import 'package:test/test.dart';

void main() {
  test('Employee 객체를 직렬화, 역직렬화 테스트, 파일 쓰기 테스트', () {
    //employee , department 객체 생성
    Employee employee = Employee(name: '홍길동', age: 41);
    Department department = Department(name: '총무부', leader: employee);

    //객체를 Json으로 직렬화
    String serialJsonString = jsonEncode(department.toJson());

    //Json을 객체로 역직렬화
    Department reverseSerialString =
        Department.fromJson(jsonDecode(serialJsonString));

    //직렬화된 파일이 company.txt에 저장
    File file = File('company.txt');
    file.writeAsStringSync(serialJsonString);

    //파일이 존재하는지 확인
    expect(file.existsSync(), isTrue);

    //원본객체와 역직렬화된 객체가 동일한지 확인
    expect(reverseSerialString.name, equals(department.name));
    expect(reverseSerialString.leader, equals(department.leader));

    //파일의 내용과 직렬화된 파일이 같은지 비교
    String fileContent = file.readAsStringSync();
    expect(fileContent, equals(serialJsonString));
  });
}
