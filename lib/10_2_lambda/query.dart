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

final List<Transaction> transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  // Problem 1: 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정렬하여 이름을 나열
  List<String> problem1(List<Transaction> transactions) {
    return transactions
        .where((e) => e.year == 2011)
        .sortedBy<num>((e) => e.value)
        .map((e) => e.trader.name)
        .toList();
  }

  // Problem 2: 거래자가 근무하는 모든 도시를 중복 없이 나열
  void problem2() {
    Set<String> result =
        transactions.map((transaction) => transaction.trader.city).toSet();

    print("Problem 2: $result");
  }

  // Problem 3: 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열
  void problem3() {
    List<String> result = transactions
        .where((transaction) => transaction.trader.city == "Cambridge")
        .map((transaction) => transaction.trader.name)
        .toList();

    result.sort();

    print("Problem 3: $result");
  }

  // Problem 4: 모든 거래자의 이름을 알파벳순으로 정렬하여 나열
  void problem4() {
    List<String> result = transactions
        .map((transaction) => transaction.trader.name)
        .toSet()
        .toList();

    result.sort();

    print("Problem 4: $result");
  }

  // Problem 5: 밀라노에 거래자가 있는가?
  void problem5() {
    bool result =
        transactions.any((transaction) => transaction.trader.city == "Milan");

    print("Problem 5: $result");
  }

  // Problem 6: 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력
  void problem6() {
    List<int> result = transactions
        .where((transaction) => transaction.trader.city == "Cambridge")
        .map((transaction) => transaction.value)
        .toList();

    print("Problem 6: $result");
  }

  // Problem 7: 전체 트랜잭션 중 최대값
  void problem7() {
    int result = transactions
        .map((transaction) => transaction.value)
        .reduce((a, b) => a > b ? a : b);

    print("Problem 7: $result");
  }

  // Problem 8: 전체 트랜잭션 중 최소값
  void problem8() {
    int result = transactions
        .map((transaction) => transaction.value)
        .reduce((a, b) => a < b ? a : b);

    print("Problem 8: $result");
  }

  // 호출하여 결과 출력
  // problem1();
  // problem2();
  // problem3();
  // problem4();
  // problem5();
  problem6();
  problem7();
  problem8();
}
