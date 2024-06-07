import 'package:learn_dart_together/03_2_collections/person.dart';

void main() {
  Person person1 = Person(name: '홍길동');
  Person person2 = Person(name: '한석봉');
  // 연습문제 2
  final List<Person> peopleList = [
    person1,
    person2,
  ];

  for (final person in peopleList) {
    print(person.name);
  }

  //연습문제 3
  final Map<String, int> ageData = {
    person1.name: 20,
    person2.name: 25,
  };
  ageData.forEach((key, value) {
    print('$key의 나이는 $value살');
  });
}
