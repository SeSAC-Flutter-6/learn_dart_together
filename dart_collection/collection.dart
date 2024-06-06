// 연습문제1
// 대한민국의 도시 이름 모음: Set
// 10명 학생의 시험 점수: List
// 대한민국의 도시별 인구수: Map

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

void main() {
  // Person 인스턴스 생성 및 이름과 나이 쌍으로 Map에 저장
  var person1 = Person('홍길동', 20);
  var person2 = Person('한석봉', 25);

  List<Person> personList = [person1, person2];

  personList.forEach((person) {
    print(person.name);
  });

  var personAgeMap = {
    person1.name: person1.age,
    person2.name: person2.age,
  };

  // Map에 저장된 값 출력
  personAgeMap.forEach((name, age) {
    print('$name의 나이는 $age살');
  });
}
