import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return 'Transaction(Trader: $trader, year: $year, value: $value)';
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

//정규표현식
bool isValidPlayerName(String name) {
  return RegExp(r'[A-Z][A-Z0-9]{7}').hasMatch(name);
}

// 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
void main() {
  var result = transactions
      .where((e) => e.year == 2011)
      .sorted((a, b) => -a.value.compareTo(b.value))
      .map((e) => e.trader.name)
      .toList();
  print(result);
  // 2011을 '2011' 처럼 문자열로 찾으면 안된다. -> year가 int 타입이기 때문에

// 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  var result1 = transactions.map((e) => e.trader.city).toSet().toList();
  print(result1);

// 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  var result2 = transactions
      .where((e) => e.trader.city == 'Cambridge')
      .sorted((a, b) => (a.trader.name.compareTo(b.trader.name)))
      .map((e) => e.trader.name);

  print(result2);

// 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  var result3 = transactions
      .sortedBy<String>((e) => e.trader.name)
      .map((e) => e.trader.name);
  print('이 결과는 sortedBy: $result3');

  //  sort 기능만 쓴다면
  //  var result4 = transactions.map((e) => e.trader.name).toList();
  //  result4.sort();
  //  근데 결과에 mario가 왜 안나올까?

  // 5. 밀라노에 거래자가 있는가?
  //먼저 밀라노만을 검색해서 거기에 거래자가 있는지를 찾아보자
  var result4 = transactions.any((e) => e.trader.city == 'Milan');
  print('밀라노에 거래자가 있는가? $result4');
  //isNotEmpty를 사용할 수도 있다

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  var result5 = transactions.where((e) => e.trader.city == 'Cambridge');
  print(result5);

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  // 오름차순으로 만들고 첫번째 값을 출력하면 되나?
  var result6 = transactions.sorted((a,b) => -a.value.compareTo(b.value)).map((e) => e.value).toList()[0];
  print(result6);

  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  var result7 = transactions.sorted((a,b) => a.value.compareTo(b.value)).map((e) => e.value).toList()[0];
  print(result7);

}
