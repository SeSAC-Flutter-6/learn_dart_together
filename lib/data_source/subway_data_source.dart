import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import '../12_data_source/subway/subway.dart';

class SubwayDataSource {
  Future<List<Subway>> getSubways() async {
    final http.Response response = await http.get(Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/0/5/%EC%84%9C%EC%9A%B8'));

    final utfDecode = utf8.decode(response.bodyBytes);
    final xmlData = XmlDocument.parse(utfDecode);
    final rowData = xmlData.findAllElements('row');

    return rowData.map((element) => Subway.fromXml(element)).toList();
  }
}