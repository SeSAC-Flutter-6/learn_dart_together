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
    return 'Transaction{trader: $trader, year: $year, value: $value}';
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

void main() {
  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  final one = transactions.where((e) => e.year == 2011)
      .sortedBy<num>((e) => e.value)
      .map((e) => e.trader.name);
  print('1. $one');
  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  final two = transactions.map((e) => e.trader.city).toSet();
  print('2. $two');
  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  final three = transactions.where((e) => e.trader.city == 'Cambridge').sortedBy<String>((e) => e.trader.name).map((e) => e.trader.toString()).toSet();
  print('3. $three');
  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  final four = transactions.sortedBy<String>((e) => e.trader.name).map((e) => e.trader.name).toSet();
  print('4. $four');
  // 5. 밀라노에 거래자가 있는가?
  final five = transactions.map((e) => e.trader.city == 'Milan').any((e) => e);
  print('5. $five');
  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  final six = transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.toString());
  // 요구하는 것이 가격인 경우
  print('6. $six');
  final sixValue = transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.value);
  print('6-2. $sixValue');
  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  final seven = transactions.map((e) => e.value).reduce((e, v) => max(e, v));
  print('7. $seven');
  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  final eight = transactions.map((e) => e.value).reduce((e, v) => min(e, v));
  print('8. $eight');
}