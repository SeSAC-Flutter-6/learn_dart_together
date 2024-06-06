// 문1.
// 다음 정보를 저장하기 좋은 컬렉션을 List, Set, Map 중 고르시오
//
// 대한민국의 도시 이름 모음 (순서 상관 없음) - set
// 10명 학생의 시험 점수 - 학생 이름 과 시험점수라면 key와 value로 Map 타입으로 사용가능해보임
// 대한민국의 도시별 인구수 (순서 상관 없음) - 도시 이름 과 도시별인구 역시 key,value값이라 Map 타입

// 문2
void main() {
  //이름을 가지는 Person 클래스를 작성하시오. Person 은 반드시 이름을 포함해야 합니다.
  Person person1 = Person('홍길동');
  Person person2 = Person('한석봉');

  // 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
  List<String> personList = [];

  personList.add('홍길동');
  personList.add('한석봉');

  // List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
  for (final name in personList) {
    print(name);
  }
  //연습문제 2 에서 작성한 Person 클래스로 생성한 ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
  Map<String, int> mapPersonList = {
    '홍길동': 20,
    '한석봉': 25,
  };
  // 그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
  // “홍길동의 나이는 20살”
  // “한석봉의 나이는 25살”

  for (var e in mapPersonList.entries) {
   print('캐릭터 이름은 ${e.key}이고 나이는 ${e.value} 이다');
  }

}

class Person {
  String name;

  Person(this.name);
}



