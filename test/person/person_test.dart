import 'package:learn_dart_together/03_encapsulation/person.dart';
import 'package:test/test.dart';

void main() {
  // birthYear가 현재 보다 높을 때 고려
  test('1996년 생인 이기영의 나이는 28이다.', () {
    Person person = Person(name: '이기영', birthYear: 1996);
    expect(person.age, equals(28));
  });
}
