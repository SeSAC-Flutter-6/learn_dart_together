import 'dart:math';
import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(
    this.name,
    this.city,
  );

  Trader copyWith({
    String? name,
    String? city,
  }) {
    return Trader(
      name ?? this.name,
      city ?? this.city,
    );
  }

  @override
  String toString() => 'Trader(name: $name, city: $city)';

  @override
  bool operator ==(covariant Trader other) {
    if (identical(this, other)) return true;

    return other.name == name && other.city == city;
  }

  @override
  int get hashCode => name.hashCode ^ city.hashCode;
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(
    this.trader,
    this.year,
    this.value,
  );

  Transaction copyWith({
    Trader? trader,
    int? year,
    int? value,
  }) {
    return Transaction(
      trader ?? this.trader,
      year ?? this.year,
      value ?? this.value,
    );
  }

  @override
  String toString() =>
      'Transaction(trader: $trader, year: $year, value: $value)';

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.trader == trader && other.year == year && other.value == value;
  }

  @override
  int get hashCode => trader.hashCode ^ year.hashCode ^ value.hashCode;
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
  transactions
      .where((e) => e.year == 2011)
      .sortedBy<num>((e) => -e.value)
      .forEach((e) => print(e.trader.name));
  print('\n');

  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  transactions.map((e) => e.trader.city).toSet().forEach(print);

  print('\n');
  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  transactions
      .where((e) => e.trader.city == 'Cambridge')
      .map((e) => e.trader.name)
      .toSet()
      .forEach(print);
  print('\n');

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  transactions
      .map((e) => e.trader.name)
      .toSet()
      .sortedBy((e) => e)
      .forEach(print);
  print('\n');

  // 5. 밀라노에 거래자가 있는가?
  print(transactions.map((e) => e.trader.city).contains('Milan'));
  print('\n');

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  transactions
      .where((e) => e.trader.city == 'Cambridge')
      .map((e) => e.value)
      .forEach(print);
  print('\n');

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  print(transactions.map((e) => e.value).reduce(max));
  print('\n');

  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  print(transactions.map((e) => e.value).reduce(min));
  print('\n');
}
