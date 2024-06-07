import 'package:learn_dart_together/03_encapsulation/Person.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('age 프로퍼티를 통해 올해년도 - birthYear를 나이로 제공', () {
    Person person = Person(name: '홍길동', birthYear: 2010);
    expect(person.age, 14);
  });
}
