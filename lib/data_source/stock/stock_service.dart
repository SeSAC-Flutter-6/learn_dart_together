import 'package:learn_dart_together/12_data_source/stock.dart';

abstract interface class StockService {
  Future<List<Stock>> getStockAndETFList();
  Future<List<Stock>> getStockAndETFListUsingCsvPackage();
}
