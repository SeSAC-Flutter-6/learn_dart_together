import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';

import '../16_data_source/alphavantage_data.dart';

class StockDataSource {
  Future<List<Map<String, dynamic>>> getStockList() async {
    final stock = await File('lib/data_source/listing_status.csv')
        .openRead()
        .transform(utf8.decoder)
        .transform(CsvToListConverter())
        .toList();
    List<Map<String, dynamic>> stockList =
        stock.map((row) => Stock.fromList(row).toMap()).toList();

    return stockList;
    // List<Map<String, dynamic>> 형태로 각 행의 데이터 포함
  }
}
