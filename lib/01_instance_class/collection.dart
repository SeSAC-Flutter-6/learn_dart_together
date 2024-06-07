// 다음 정보를 저장하기 좋은 컬렉션을 List, Set, Map 중 고르시오
/*
|특성     | List  |    Set  |
|순서 보장 | 예     |   아니요  |
|중복허용  | 예     |   아니요  |
|인덱스 접근| 예     |   아니요 |

1. 대한민국의 도시 이름 모음 (순서 상관 없음)
List, 전라도 광주광역시 - 경기도 광주시, 

2. 10명 학생의 시험 점수
List - 점수가 같은 사람이 있을 수 있으므로, 순서, 중복, 인덱스 허용이 되는 List가 좋을 것 같다.

3. 대한민국의 도시별 인구수 (순서 상관 없음)
Map, 키-값으로 구분하면 좋을 것 같음 
*/

////////////////////////////////////////////////////////////////////////////////////////
// 이름을 가지는 Person 클래스를 작성하시오. Person 은 반드시 이름을 포함해야 합니다.
// 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
// List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.

void main() {
  Person person1 = Person(name: '홍길동');
  Person person2 = Person(name: '한석봉');

  List<Person> personList = [person1, person2];

  for (var person in personList) {
    print(person.name);
  }

  Map<String, Person> peopleMap = {
    person1.name: person1,
    person2.name: person2,
  };
  peopleMap['홍길동']!.age = 20;
  peopleMap['한석봉']!.age = 25;

  peopleMap.forEach((name, person) {
    print('$name의 나이는 ${person.age}살');
  });
}

class Person {
  String name;
  int? age;

  Person({required this.name, this.age});
}
