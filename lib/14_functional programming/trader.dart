import 'package:collection/collection.dart';
import 'package:learn_dart_together/14_functional%20programming/training_01.dart';




class Trader {
  //final transactions = [];

  void main() {
    print(transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.trader.name)
        .sorted()
        .toSet());

    print(transactions
        .map((e) => e.value)
        .max);
    print(transactions
        .map((e) => e.value)
        .min);


    // escape sequence
    String tt = r'C:\dev';
    // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
    print(transactions.where((e) => e.year == 2011)
        .sorted((a, b) => a.value.compareTo(b.value)));
    //     .sortedBy<num>((e) => e.value)
    //     .map((e) => e.trader.name));

    final five = transactions.any((e) => e.trader.city == 'Milan');
  }

  bool isValidPlayerName(String name) {
    return RegExp(r'[A-Z][A-Z0-9]{7}').hasMatch(name);
  }

  List<String> problem3(List<Transaction> transactions) {
    return transactions
        .where((transaction) => transaction.trader.city == "Cambridge")
        .map((transaction) => transaction.trader.name)
        .toList()
        .sorted();
  }
}