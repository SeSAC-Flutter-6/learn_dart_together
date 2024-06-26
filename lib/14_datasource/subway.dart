import 'package:xml/xml.dart';

class Subway {
  int subwayId; // 지하철 ID
  int fromId; // 출발역 ID
  int toId; // 도착역 ID
  String currentStn; // 현재 역 이름
  String status; // 열차 상태

  Subway({
    required this.subwayId,
    required this.fromId,
    required this.toId,
    required this.currentStn,
    required this.status,
  });

  factory Subway.fromXml(XmlElement xml) {
    int getInt(String tag) => int.parse(xml.findElements(tag).single.innerText);
    String getStr(String tag) => xml.findElements(tag).single.innerText;

    return Subway(
      subwayId: getInt('subwayId'),
      fromId: getInt('statnFid'),
      toId: getInt('statnTid'),
      currentStn: getStr('statnNm'),
      status: getStr('btrainSttus'),
    );
  }

  @override
  String toString() =>
      'Subway(subwayId: $subwayId, fromId: $fromId, toId: $toId, currentStn: $currentStn, status: $status)';
}
