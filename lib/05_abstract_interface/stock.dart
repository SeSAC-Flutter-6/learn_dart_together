import 'package:learn_dart_together/05_abstract_interface/financialAsset.dart';

class Stock extends FinancialAsset {
  String stockCode;

  Stock({
    required super.name,
    required super.price,
    required this.stockCode,
  });
}