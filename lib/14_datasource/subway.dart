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
    String get(String tag) => xml.findElements(tag).single.innerText;
    
    return Subway(
      subwayId: int.parse(get('subwayId')),
      fromId: int.parse(get('statnFid')),
      toId: int.parse(get('statnTid')),
      currentStn: get('statnNm'),
      status: get('btrainSttus'),
    );
  }

  @override
  String toString() =>
      'Subway(subwayId: $subwayId, fromId: $fromId, toId: $toId, currentStn: $currentStn, status: $status)';
}
