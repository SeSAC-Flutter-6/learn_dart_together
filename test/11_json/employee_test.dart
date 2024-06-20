import 'package:learn_dart_together/11_json/employee.dart';
import 'package:test/test.dart';

void main() {
  test('Department 직렬화', () async {
    final Map<String, dynamic> expected = {
      'name': '총무부',
      'leader': {
        'name': '홍길동',
        'age': 41,
      }
    };

    final department = Department(
      '총무부',
      Employee('홍길동', 41),
    );

    expect(department.toJson(), expected);
  });

  test('Department 역직렬화', () {
    final Map<String, dynamic> json = {
      'name': '총무부',
      'leader': {
        'name': '홍길동',
        'age': 41,
      }
    };

    final department = Department.fromJson(json);

    expect(department.name, '총무부');
    expect(department.leader.name, '홍길동');
    expect(department.leader.age, 41);
  });
}
