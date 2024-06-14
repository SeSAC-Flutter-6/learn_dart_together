import 'package:collection/collection.dart';

import '../01_instance_class/hero.dart';

void main() {
  String greeting = 'Hello';

  print(greeting.replaceAll('H', 'J')); // Jello
  print(greeting);  // Hello

  int luckyNumber1 = 13;
  int luckyNumber2 = luckyNumber1;
  luckyNumber2 = 12;

  print(luckyNumber1);
  print(luckyNumber2);

  List<int> list1 = [1, 2, 3];
  List<int> list2 = [1, 2, 3];

  // ListEquality<int> equality = ListEquality();
  // print(equality.equals(list1, list2));

  // 동등성 비교
  print(list1.equals(list2));

  List<int> list3 = list1.sorted((a, b) => a.compareTo(b));

  List<Hero> heroes = [
    Hero(name: 'bb', hp: 100),
    Hero(name: 'aa', hp: 50),
  ];

  // 이걸 더 쓸거임
  List<Hero> list4 = heroes.sorted((a, b) => a.hp.compareTo(b.hp));
  List<Hero> list5 = heroes.sortedBy<num>((hero) => hero.hp);
}