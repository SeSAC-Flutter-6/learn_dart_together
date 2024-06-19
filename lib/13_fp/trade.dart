import 'package:collection/collection.dart';
import 'dart:math';

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
  final resultYear = transactions
      .where((e) => e.year == 2011)
      .sortedBy<num>((e) => e.value)
      .map((e) => e.trader.name); //1

  List<String> cities = transactions
      .map((transaction) => transaction.trader.city)
      .toSet()
      .toList()
    ..sort(); //2

  List<String> cambridgeTrader = transactions
      .where((e) => e.trader.city == "Cambridge")
      .map((transaction) => transaction.trader.name)
      .toList()
    ..sort(); //3

  List<String> allTrader = transactions
      .map((transaction) => transaction.trader.name)
      .toList()
    ..sort(); //4

  bool isMilanTrader =
      transactions.any((transaction) => transaction.trader.city == "Milan");

  List<Transaction> cambridgeTransactions = transactions
      .where((transaction) => transaction.trader.city == "Cambridge")
      .toList();

  int maxValue =
      transactions.map((transaction) => transaction.value).reduce(max);

  int minValue =
      transactions.map((transaction) => transaction.value).reduce(min);
}

bool isValidPlayerName(String name) {
  return RegExp(r'[A-Z][A-Z0-9]{7}').hasMatch(name);
}
