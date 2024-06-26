import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import '../15_datasource/practice_5/stock_info.dart';

class StockDataSource {
  Future<List<StockInfo>> getStocks() async {
    final http.Response response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo'));

    String csvString = response.body;
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);

    // 첫 번째 줄(제목 줄) 제거
    csvTable.removeAt(0);

    return csvTable.map((e) {
      return StockInfo(
        symbol: e[0],
        name: e[1],
        exchange: e[2],
        assetType: e[3],
        ipoDate: e[4],
        delistingDate: e[5],
        status: e[6],
      );
    }).toList();
  }
}
