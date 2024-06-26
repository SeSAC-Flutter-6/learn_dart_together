import 'dart:convert';
import 'package:learn_dart_together/12_data_source/stock.dart';
import 'package:learn_dart_together/12_data_source/data_source/stock/stock_service.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

class StockServiceImpl implements StockService {
  final String _baseURL = 'https://www.alphavantage.co/';

  @override
  Future<List<Stock>> getStockAndETFList() async {
    try {
      final response = await http.get(
          Uri.parse('${_baseURL}query?function=LISTING_STATUS&apikey=demo'));
      if (response.statusCode == 200) {
        final String csvString = utf8.decode(response.bodyBytes);
        final List<String> dataRows = LineSplitter().convert(csvString);

        List<Stock> stocks = dataRows
            .skip(1) // 첫 번째 줄은 헤더이므로 건너뜀
            .map((line) => line.split(','))
            .map((row) => Stock.fromCSV(row))
            .toList();

        return stocks;
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }

  @override
  Future<List<Stock>> getStockAndETFListUsingCsvPackage() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseURL/query?function=LISTING_STATUS&apikey=demo'),
      );

      if (response.statusCode == 200) {
        final String csvString = utf8.decode(response.bodyBytes);
        final List<List<dynamic>> csvData =
            CsvToListConverter().convert(csvString);

        List<Stock> stocks = csvData
            .skip(1)
            .map((row) => Stock.fromCSV(row.map((e) => e.toString()).toList()))
            .toList();

        return stocks;
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
