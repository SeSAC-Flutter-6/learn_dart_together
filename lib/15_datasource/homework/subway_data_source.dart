import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

void main() async {
  print(await SubwayDataSource().getSubWayInfo());
}

class SubwayDataSource {
  Future<List<Row>> getSubWayInfo() async {
    final response = await http.get(Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/0/5/%EC%84%9C%EC%9A%B8'));
    String responseBody = utf8.decode(response.bodyBytes);
    final document = XmlDocument.parse(responseBody);
    final rows = document
        .findAllElements('row')
        .map((element) => Row.fromXml(element))
        .toList();
    return rows;
  }
}

class Row {
  final String trainLineNm;
  final String bstatnNm;

  Row({
    required this.trainLineNm,
    required this.bstatnNm,
  });

  factory Row.fromXml(XmlElement element) {
    return Row(
      trainLineNm: element.findElements('trainLineNm').first.text,
      bstatnNm: element.findElements('bstatnNm').first.text,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Row &&
          runtimeType == other.runtimeType &&
          trainLineNm == other.trainLineNm &&
          bstatnNm == other.bstatnNm;

  @override
  int get hashCode => trainLineNm.hashCode ^ bstatnNm.hashCode;

  @override
  String toString() {
    return 'Row{trainLineNm: $trainLineNm, bstatnNm: $bstatnNm}';
  }

  Row copyWith({
    String? trainLineNm,
    String? bstatnNm,
  }) {
    return Row(
      trainLineNm: trainLineNm ?? this.trainLineNm,
      bstatnNm: bstatnNm ?? this.bstatnNm,
    );
  }
}
