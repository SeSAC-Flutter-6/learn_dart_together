import 'package:learn_dart_together/person.dart';
import 'package:test/test.dart';

void main() {
  test('1996년 생인 이기영의 나이는 28이다.', () {
    Person person = Person(name: '이기영', birthYear: 1996);
    expect(person.age, equals(28));
  });
}
