import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/17_datasource/train.dart';
import 'package:xml2json/xml2json.dart';

class TrainApi {
  Future<List<Train>> getSTrains() async {
    final Xml2Json xml2Json = Xml2Json();
    final http.Response response = await http.get(Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/0/5/'));

    xml2Json.parse(utf8.decode(response.bodyBytes));
    var jsonData = xml2Json.toParker();

    final Map<String, dynamic> map = jsonDecode(jsonData);
    final List jsonList = map['realtimeStationArrival']['row'] as List;
    return jsonList.map((e) => Train.fromJson(e)).toList();
  }
}

void main() async {
  TrainApi trainApi = TrainApi();
  try {
    List<Train> trains = await trainApi.getSTrains();
    // 여기서 trains를 사용하여 필요한 작업을 수행할 수 있습니다.
    print(trains);
  } catch (e) {
    print('Error: $e');
  }
}
