import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import '../16_data_source/subway.dart';

class SubwayDataSource {
  final baseUrl =
      'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/0/5/서울';

  Future getSeoulSubway() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final reponseBody = utf8.decode(response.bodyBytes);
      final document = XmlDocument.parse(reponseBody);
      final rowNum = document.findAllElements('row');
      // print(rowNum);
      return rowNum.map((xml) => SeoulSubway.fromXml(xml)).toList();
    }
  }
}
