import 'package:xml/xml.dart';

class RealtimeStationArrival {
  int subwayId;
  String upDownLine;
  String stationName;
  String recptnDt;

  RealtimeStationArrival({
    required this.subwayId,
    required this.upDownLine,
    required this.stationName,
    required this.recptnDt,
  });

  RealtimeStationArrival.fromXml(XmlElement xml)
      : subwayId = int.parse(xml.getElement('subwayId')?.innerText ?? '0'),
        upDownLine = xml.getElement('updnLine')?.innerText ?? '',
        stationName = xml.getElement('statnNm')?.innerText ?? '',
        recptnDt = xml.getElement('recptnDt')?.innerText ?? '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RealtimeStationArrival &&
          runtimeType == other.runtimeType &&
          subwayId == other.subwayId &&
          upDownLine == other.upDownLine &&
          stationName == other.stationName &&
          recptnDt == other.recptnDt;

  @override
  int get hashCode =>
      subwayId.hashCode ^
      upDownLine.hashCode ^
      stationName.hashCode ^
      recptnDt.hashCode;

  @override
  String toString() {
    return 'RealtimeStationArrival{subwayId: $subwayId, upDownLine: $upDownLine, stationName: $stationName, recptnDt: $recptnDt}';
  }

  RealtimeStationArrival copyWith({
    int? subwayId,
    String? upDownLine,
    String? stationName,
    String? recptnDt,
  }) {
    return RealtimeStationArrival(
      subwayId: subwayId ?? this.subwayId,
      upDownLine: upDownLine ?? this.upDownLine,
      stationName: stationName ?? this.stationName,
      recptnDt: recptnDt ?? this.recptnDt,
    );
  }
}
