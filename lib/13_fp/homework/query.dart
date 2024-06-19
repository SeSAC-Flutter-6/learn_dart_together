import 'dart:math';

import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  final test1 = transactions
      .where((e) => e.year == 2011)
      .sortedBy<num>((e) => e.value)
      .map((e) => e.trader.name)
      .toList();
  print(test1); // [Cambridge, Milan]

  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  final test2 = transactions.map((e) => e.trader.city).toSet().toList();
  print(test2); // [Alan, Brian, Raoul]

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  final test3 = transactions
      .where((e) => e.trader.city == "Cambridge")
      .map((e) => e.trader)
      .sortedBy((e) => e.name)
      .map((e) => e.name)
      .toSet()
      .toList();
  print(test3); // [Alan, Brian, Mario, Raoul]

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  final test4 = transactions
      .sortedBy((e) => e.trader.name)
      .map((e) => e.trader.name)
      .toSet()
      .toList();
  print(test4); // true

  // 5. 밀라노에 거래자가 있는가?
  final test5 = transactions.any((e) => e.trader.city == "Milan");
  print(test5); //true

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  final test6 = transactions
      .where((e) => e.trader.city == "Cambridge")
      .map((e) => e.value)
      .toList();
  print(test6); // [300, 1000, 400, 950]

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  final test7 = transactions.map((e) => e.value).reduce((e, v) => max(e, v));
  print(test7); // 1000

  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  final test8 = transactions.map((e) => e.value).reduce((e, v) => min(e, v));
  print(test8); // 300
}
