import 'person.dart';

void main() {
  Person person1 = Person(name: '홍길동');
  Person person2 = Person(name: '한석봉');
  List<Person> persons = [person1, person2];

  for (Person person in persons) {
    print(person.name);
  }

  Map<Person, int> personsWithAge = {
    person1: 20,
    person2: 25,
  };

  Iterator<MapEntry<Person, int>> iterator = personsWithAge.entries.iterator;
  while (iterator.moveNext()) {
    var entry = iterator.current;
    print('${entry.key.name}의 나이는 ${entry.value}살');
  }

  for (Person person in personsWithAge.keys) {
    print('${person.name}의 나이는 ${personsWithAge[person]}살');
  }

  for (var entry in personsWithAge.entries) {
    print('${entry.key.name}의 나이는 ${entry.value}살');
  }
}
