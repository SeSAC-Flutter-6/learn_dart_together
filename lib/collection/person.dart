class Person {
  String name;

  Person({required this.name});
}

void main() {
//연습문제1
// 다음 정보를 저장하기 좋은 컬렉션을 List, Set, Map 중 고르시오

// Q. 대한민국의 도시 이름 모음 (순서 상관 없음)
// A. Set(도시 이름이 중복되면 안 됨)

// Q. 10명 학생의 시험 점수
// A. List(점수가 중복될 수도 있고 순서는 상관없을 때)
// A. Map(학생 이름과 점수가 매치가 돼야 될 때)

// Q. 대한민국의 도시별 인구수 (순서 상관 없음)
// A. Map(도시와 인구수가 매칭이 되야 함)

  Person person1 = Person(name: '홍길동');
  Person person2 = Person(name: '한석봉');

  //연습문제2
  List<String> personList = [];
  personList.add(person1.name);
  personList.add(person2.name);
  print(personList);

  //연습문제3
  Map<String, int> personMap = {};
  personMap[person1.name] = 20;
  personMap[person2.name] = 25;
}
