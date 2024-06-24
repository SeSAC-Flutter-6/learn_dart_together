import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:learn_dart_together/17_datasource/stock.dart';
import 'package:http/http.dart' as http;

class StockApi {
  Future<List<Stock>> getStock() async {
    final http.Response response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo'));

    final List<List<dynamic>> csvData =
        const CsvToListConverter().convert(response.body);
    List<Stock> stocks = csvData.map((row) {
      return Stock(
        symbol: row[0].toString(),
        name: row[1].toString(),
        exchange: row[2].toString(),
        assetType: row[3].toString(),
        ipoDate: row[4].toString(),
        delistingDate: row[5].toString(),
        istatus: row[6].toString(),
      );
    }).toList();

    return stocks; // Stock 객체 리스트 반환
  }
}

void main() async {
  StockApi stockApi = StockApi();
  List<Stock> stocks = await stockApi.getStock();
  // 결과 출력
  stocks.forEach((stock) {
    print(stock);
  });
}
