import 'package:fast_csv/csv_converter.dart';
import 'package:http/http.dart' as http;

import '../12_data_source/status/status.dart';

class StatusDataSource {
  Future<List<Status>> getStatuses() async {
    final http.Response response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo'));
    final data = CsvConverter().convert(response.body);
    final List<String> fields = [
      'symbol',
      'name',
      'exchange',
      'assetType',
      'ipoDate',
      'delistingDate',
      'status'
    ];

    List<Map<String, dynamic>> jsonList = [];
    for (var row in data) {
      Map<String, dynamic> map = {};
      for (int i = 0; i < fields.length; i++) {
        map[fields[i]] = row[i];
      }
      jsonList.add(map);
    }

    return jsonList.map((element) => Status.fromJson(element)).toList();
  }
}