import 'package:learn_dart_together/01_instance_class/person.dart';

void main() {
  // Q1. 다음 정보를 저장하기 좋은 컬렉션을 List, Set, Map 중 고르시오.
  // 1) 대한민국의 도시 이름 모음
  // A1. Set
  // 대한민국의 도시 이름이 중복되지 않는다는 전제 하에 Set 자료구조가 적합하다고 생각함.
  // 2) 10명 학생의 시험 점수
  // A2. Map
  // 학생을 Key, 점수를 value로 하여 관리한다면, 학생 별로 점수를 검색하기에 용이하다고 생각. 그러나 점수를 정렬해야 한다면 일반적으로 List가 유리한 자료구조 일듯.
  // 대한민국의 도시별 인구수
  // A3. Map
  // 도시를 Key, 인구수를 value로 관리. 다만, 대한민국 내 도시 이름이 고유해야한다는 전제가 필요함.

  final Person hong = Person(name: '홍길동', birthYear: 2004);
  final Person han = Person(name: '한석봉', birthYear: 1999);

  // Q2. List 활용해보시오.
  final List<Person> people = [hong, han];
  // 생성 이후 추가한다면 아래와 같음
  // people.add(hong);
  // people.add(han);

  people.forEach((person) {
    print(person.name);
  });

  // Q3. Map을 활용해보시오.
  final Map<String, int> nameAndAge = {};
  nameAndAge[hong.name] = hong.age;
  nameAndAge[han.name] = han.age;

  nameAndAge.entries.forEach((element) {
    print('${element.key}의 나이는 ${element.value}살');
  });
}