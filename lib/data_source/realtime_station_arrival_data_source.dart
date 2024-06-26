import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/18_data_source/realtime_station_arrival.dart';
import 'package:xml/xml.dart';

class RealtimeStationArrivalDataSource {
  Future<List<RealtimeStationArrival>> getArrivalTime() async {
    final response = await http.get(Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/0/5/%EC%84%9C%EC%9A%B8'));
    final xmlData = XmlDocument.parse(utf8.decode(response.bodyBytes));
    final row = xmlData.findAllElements('row');
    final data = row.map((e) => RealtimeStationArrival.fromXml(e)).toList();
    return data;
  }
}

void main() async {
  final data = await RealtimeStationArrivalDataSource().getArrivalTime();
  print(data);
}
