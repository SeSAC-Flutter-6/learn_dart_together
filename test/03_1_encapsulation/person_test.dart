import 'package:learn_dart_together/03_1_encapsulation/person.dart';
import 'package:test/test.dart';

void main() {
  final int currentYear = DateTime.now().year;
  group('Person age property test', () {
    test('1: age는 (올해년도 - 출생년도) 계산한다', () {
      Person person = Person(name: '김야옹', birthYear: 1989);
      expect(person.age, currentYear - person.birthYear);
    });
    test('2: 출생년도가 올해년도보다 미래일 수 없다', () {
      expect(() => Person(name: '이어흥', birthYear: currentYear + 1).age,
          throwsException);
    });
  });
}
