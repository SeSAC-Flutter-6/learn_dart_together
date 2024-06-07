import 'package:learn_dart_together/02_collection/person.dart';

void main() {
  /** ========================================================
  연습문제 1. 다음 정보를 저장하기 좋은 컬렉션을 List, Set, Map 중 고르시오.

  (1) 대한민국의 도시 이름 모음(순서 상관 없음)
  - Set
  - 순서가 상관 없고, 중복이 불가능하므로 Set이 적절하다.
  (2) 10명 학생의 시험 점수
  - Map
  - 학생 이름과 점수가 쌍을 이루어야 하므로 Map이 적절하다.
  (3) 대한민국의 도시별 인구수(순서 상관 없음)
  - Map
  - 도시명과 인구수가 쌍을 이루어야 하므로 Map이 적절하다.
  ======================================================== **/

  Map<String, int> ageInfo = {'홍길동': 20, '한석봉': 25};

  Person person1 = Person('홍길동');
  Person person2 = Person('한석봉');

  List<Person> people = [person1, person2];

  for (final person in people) {
    final String name = person.name;
    print(name); // 연습문제 2
    print('$name의 나이는 ${ageInfo[name]}살'); // 연습문제 3
  }
}
