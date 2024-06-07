// 문1.
// 다음 정보를 저장하기 좋은 컬렉션을 List, Set, Map 중 고르시오
//
// 대한민국의 도시 이름 모음 (순서 상관 없음) - set
// 10명 학생의 시험 점수 - 학생 이름 과 시험점수라면 key와 value로 Map 타입으로 사용가능해보임
// 대한민국의 도시별 인구수 (순서 상관 없음) - 도시 이름 과 도시별인구 역시 key,value값이라 Map 타입

// 문2
void main() {
  //이름을 가지는 Person 클래스를 작성하시오. Person 은 반드시 이름을 포함해야 합니다.
  Person person1 = Person('홍길동', birthYear: 2004);
  Person person2 = Person('한석봉', birthYear: 1992);

  // 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
  List<Person> personList = [person1, person2];

  // List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
  for (final person in personList) {
    print(person.name);
  }
  //연습문제 2 에서 작성한 Person 클래스로 생성한 ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
  Map<String, int> peopleList = {
    person1.name: person1.age,
    person2.name: person2.age,
  };
  // 그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
  // “홍길동의 나이는 20살”
  // “한석봉의 나이는 25살”

  for (var e in peopleList.entries) {
    print('캐릭터 이름은 ${e.key}이고 나이는 ${e.value} 이다');
  }
}

class Person {
  // 이름과 태어난 해는 한번 정해지면 수정이 불가능하다.
  final String name;
  final int birthYear;

  // age 프로퍼티를 통해 나이를 제공하지만, 임의로 수정은 불가능하다.

  int get age => DateTime.now().year - birthYear;

  // 이름과 태어난 해를 생성자로 받는다 (name, birthYear)
  Person(
    this.name, {
    required this.birthYear,
  });

  // 나이 계산은 올해년도에서 birthYear 년도를 뺀 값을 리턴한다
  // 현재 시간과 날짜는 DateTime 클래스를 활용하면 얻을 수 있다
  // https://api.dart.dev/stable/3.3.1/dart-core/DateTime-class.html

}
