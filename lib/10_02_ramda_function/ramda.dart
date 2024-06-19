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

  @override
  String toString() {
    return '{\'거래연도\': \'${year}\', \'거래금액\': \'${value}\', \'거래자\': \'${trader.name}\', \'근무지\': \'${trader.city}\'}';
  }

  @override
  int get hashCode => trader.city.hashCode;
}

final transactions = [
  Transaction(Trader('Brian', 'Cambridge'), 2011, 300),
  Transaction(Trader('Raoul', 'Cambridge'), 2012, 1000),
  Transaction(Trader('Raoul', 'Cambridge'), 2011, 400),
  Transaction(Trader('Mario', 'Milan'), 2012, 710),
  Transaction(Trader('Mario', 'Milan'), 2012, 700),
  Transaction(Trader('Alan', 'Cambridge'), 2012, 950),
];

class Answer {
  String question;
  Function answer;

  Answer({
    required this.question,
    required this.answer,
  });
}

final List<Answer> answers = [
  Answer(
      question: '2011년에 발생한 트랜잭션을 가격 기준으로 오름 차순 정렬',
      answer: () {
        transactions
            .where((e) => e.year == 2011)
            .sortedBy<num>((e) => e.value)
            .forEach((e) => print(e.toString()));
      }),
  Answer(
      question: '케임브리지에서 근무하는 모든 거래자를 찾아서 이름 순으로 정렬하여 나열하시오',
      answer: () {
        transactions
            .where((e) => e.trader.city == 'Cambridge')
            .sortedBy<String>((e) => e.trader.name)
            .forEach((e) => print(e.toString()));
      }),
  Answer(
      question: '모든 거래자의 이름을 알파벳 순으로 정렬하여 나열하시오',
      answer: () {
        transactions
            .sortedBy<String>((e) => e.trader.name)
            .forEach((e) => print(e.toString()));
      }),
  Answer(
      question: '밀라노에 거래자가 있는가?',
      answer: () {
        print(!transactions.where((e) => e.trader.city == 'Milan').isEmpty);
      }),
  Answer(
      question: '케임브리지에 거주하는 거래자의 모든 트랜잭션 값을 출력하시오',
      answer: () {
        transactions
            .where((e) => e.trader.city == 'Cambridge')
            .forEach((e) => print(e.value));
      }),
  Answer(
      question: '전체 트랜잭션 중 최대값은 얼마인가?',
      answer: () {
        print(transactions.sortedBy<num>((e) => e.value).reversed.toList()[0]);
      }),
  Answer(
      question: '전체 트랜잭션 중 최소값은 얼마인가?',
      answer: () {
        print(transactions.sortedBy<num>((e) => e.value).toList()[0]);
      }),
];

void main() {
  answers.forEach((e) {
    print(e.question);
    e.answer();
    print('\n');
  });
}
