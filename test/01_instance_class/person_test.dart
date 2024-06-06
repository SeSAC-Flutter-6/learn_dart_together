import 'package:test/test.dart';
import 'package:learn_dart_together/01_instance_class/person.dart';

void main() {
  test('Person 클래스의 생성자가 예외를 발생시키는지 테스트', () {
    test('태어난 년도가 현재 년도보다 클 경우', () {
      final nowYear = DateTime.now().year;
      final futureYear = nowYear - 1;
      expect(() => Person('John', futureYear), throwsException);
    });
  });

  test('Person 클래스의 나이 계산이 올바른지 테스트', () {
    final nowYear = DateTime.now().year;
    final birthYear = 1990;
    final expectedAge = nowYear - birthYear;

    final person = Person('John', birthYear);

    expect(person.age, equals(expectedAge));
  });
}
