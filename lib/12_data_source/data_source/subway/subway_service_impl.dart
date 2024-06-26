import 'dart:convert';
import 'package:learn_dart_together/12_data_source/realtime_station_arrival.dart';
import 'package:learn_dart_together/12_data_source/data_source/subway/subway_service.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:learn_dart_together/utils/xml_util.dart';

class SubwayServiceImpl implements SubwayService {
  final String _baseURL =
      'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/';

  @override
  Future<List<RealtimeStationArrival>> getRealtimeStationArrival({
    required String startIndex,
    required String endIndex,
    required String statnNm,
  }) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseURL$startIndex/$endIndex/$statnNm'));
      if (response.statusCode == 200) {
        final String xmlString = utf8.decode(response.bodyBytes);
        final List<String> xmlDataList =
            XmlUtils.extractTagValues(xmlString, 'row');
        final List<RealtimeStationArrival> dataList = xmlDataList
            .map<RealtimeStationArrival>(
                (data) => RealtimeStationArrival.fromXML(data))
            .toList();
        return dataList;
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }

  @override
  Future<List<RealtimeStationArrival>>
      getRealtimeStationArrivalUsingXmlPackage({
    required String startIndex,
    required String endIndex,
    required String statnNm,
  }) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseURL$startIndex/$endIndex/$statnNm'));
      if (response.statusCode == 200) {
        final xmlDoc = XmlDocument.parse(utf8.decode(response.bodyBytes));
        final List<RealtimeStationArrival> dataList = xmlDoc
            .findAllElements('row')
            .map((xmlElement) =>
                RealtimeStationArrival.fromXmlPackage(xmlElement))
            .toList();
        return dataList;
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }
}
