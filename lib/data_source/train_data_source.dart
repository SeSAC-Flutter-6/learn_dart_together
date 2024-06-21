import 'package:http/http.dart' as http;
import 'dart:convert';
import '../15_datasource/practice_4/train_time_info.dart';
import 'package:xml/xml.dart';

class TrainDataSource {
  Future<List<TrainTimeInfo>> getInfos() async {
    final http.Response response = await http.get(Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/0/5/서울'));
    // UTF-8로 디코딩
    String xmlString = utf8.decode(response.bodyBytes);
    final document = XmlDocument.parse(xmlString);

    final trainTimeInfo = document.findAllElements('row').map((element) {
      return TrainTimeInfo.fromXml(element);
    }).toList();

    return trainTimeInfo;
  }
}
