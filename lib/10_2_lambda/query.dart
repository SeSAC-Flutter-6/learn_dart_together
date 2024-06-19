import 'package:collection/collection.dart';

void main() {
  final List<Transaction> transactions = [
    Transaction(Trader("Brian", "Cambridge"), 2011, 300),
    Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
    Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
    Transaction(Trader("Mario", "Milan"), 2012, 710),
    Transaction(Trader("Mario", "Milan"), 2012, 700),
    Transaction(Trader("Alan", "Cambridge"), 2012, 950),
  ];

  // Problem 1: 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정렬하여 이름을 나열
  print(problem1(transactions));

  // Problem 2: 거래자가 근무하는 모든 도시를 중복 없이 나열
  print(problem2(transactions));

  // Problem 3: 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열
  print(problem3(transactions));

  // Problem 4: 모든 거래자의 이름을 알파벳순으로 정렬하여 나열
  print(problem4(transactions));

  // Problem 5: 밀라노에 거래자가 있는가?
  print(problem5(transactions));

  // Problem 6: 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력
  problem6(transactions);

  // Problem 7: 전체 트랜잭션 중 최대값
  print(problem7(transactions));

  // Problem 8: 전체 트랜잭션 중 최대값
  print(problem8(transactions));
}

// Problem 1: 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정렬하여 이름을 나열
List<String> problem1(List<Transaction> transactions) {
  return transactions
      .where((e) => e.year == 2011)
      .sortedBy<num>((e) => e.value)
      .map((e) => e.trader.name)
      .toList();
}

// Problem 2: 거래자가 근무하는 모든 도시를 중복 없이 나열
List<String> problem2(List<Transaction> transactions) {
  return transactions
      .map((transaction) => transaction.trader.city)
      .toSet()
      .toList();
}

// Problem 3: 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열
List<String> problem3(List<Transaction> transactions) {
  return transactions
      .where((transaction) => transaction.trader.city == "Cambridge")
      .map((transaction) => transaction.trader.name)
      .toList()
      .sorted();
}

// Problem 4: 모든 거래자의 이름을 알파벳순으로 정렬하여 나열
List<String> problem4(List<Transaction> transactions) {
  return transactions
      .map((transaction) => transaction.trader.name)
      .toSet()
      .toList()
      .sorted();
}

// Problem 5: 밀라노에 거래자가 있는가?
bool problem5(List<Transaction> transactions) {
  return transactions.any((transaction) => transaction.trader.city == "Milan");
}

// Problem 6: 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력
void problem6(List<Transaction> transactions) {
  List<Transaction> result = transactions
      .where((transaction) => transaction.trader.city == "Cambridge")
      .toList();

  print("Problem 6:");
  for (var transaction in result) {
    print(transaction);
  }
}

// Problem 7: 전체 트랜잭션 중 최대값
int problem7(List<Transaction> transactions) {
  return transactions
      .map((transaction) => transaction.value)
      .reduce((a, b) => (a > b) ? a : b);
}

// Problem 8: 전체 트랜잭션 중 최소값
int problem8(List<Transaction> transactions) {
  return transactions
      .map((transaction) => transaction.value)
      .reduce((a, b) => (a < b) ? a : b);
}

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return 'Trader(name: $name, city: $city)';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return 'Transaction(${trader.toString()}, year: $year, value: $value)';
  }
}
