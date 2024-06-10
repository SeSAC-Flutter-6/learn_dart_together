import 'package:learn_dart_together/03_encapsulation/person.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Person', () {
    test('나이는 현재년도 - 출생년도 이다.', () {
      final Person person = Person(name: '아무개', birthYear: 1998);
      expect(person.age, equals(26));
    });
  });
}