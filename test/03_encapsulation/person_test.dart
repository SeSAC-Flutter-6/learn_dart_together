import 'package:learn_dart_together/03_encapsulation/person.dart';
import 'package:test/test.dart';

void main() {
  test('Person age getter test', () {
    final person = Person(name: "동동이", birthYear: 2000);

    expect(person.age, 24);
  });
}
