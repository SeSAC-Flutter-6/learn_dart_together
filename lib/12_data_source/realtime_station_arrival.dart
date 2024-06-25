import 'package:learn_dart_together/utils/xml_util.dart';
import 'package:xml/xml.dart';

class RealtimeStationArrival {
  final int rowNum;
  final int totalCount;
  final String subwayId;
  final String updnLine;
  final String trainLineNm;
  final String statnNm;
  final String btrainSttus;
  final String btrainNo;
  final DateTime recptnDt;
  final String arvlMsg2;

  RealtimeStationArrival({
    required this.rowNum,
    required this.totalCount,
    required this.subwayId,
    required this.updnLine,
    required this.trainLineNm,
    required this.statnNm,
    required this.btrainSttus,
    required this.btrainNo,
    required this.recptnDt,
    required this.arvlMsg2,
  });

  factory RealtimeStationArrival.fromXML(String xml) {
    return RealtimeStationArrival(
      rowNum: int.parse(XmlUtils.getElementValue(xml, 'rowNum')),
      totalCount: int.parse(XmlUtils.getElementValue(xml, 'totalCount')),
      subwayId: XmlUtils.getElementValue(xml, 'subwayId'),
      updnLine: XmlUtils.getElementValue(xml, 'updnLine'),
      trainLineNm: XmlUtils.getElementValue(xml, 'trainLineNm'),
      statnNm: XmlUtils.getElementValue(xml, 'statnNm'),
      btrainSttus: XmlUtils.getElementValue(xml, 'btrainSttus'),
      btrainNo: XmlUtils.getElementValue(xml, 'btrainNo'),
      recptnDt: DateTime.parse(XmlUtils.getElementValue(xml, 'recptnDt')),
      arvlMsg2: XmlUtils.getElementValue(xml, 'arvlMsg2'),
    );
  }

  factory RealtimeStationArrival.fromXmlPackage(XmlElement xmlElement) {
    return RealtimeStationArrival(
      rowNum: int.parse(xmlElement.getElement('rowNum')?.innerText ?? '0'),
      totalCount:
          int.parse(xmlElement.getElement('totalCount')?.innerText ?? '0'),
      subwayId: xmlElement.getElement('subwayId')?.innerText ?? '',
      updnLine: xmlElement.getElement('updnLine')?.innerText ?? '',
      trainLineNm: xmlElement.getElement('trainLineNm')?.innerText ?? '',
      statnNm: xmlElement.getElement('statnNm')?.innerText ?? '',
      btrainSttus: xmlElement.getElement('btrainSttus')?.innerText ?? '',
      btrainNo: xmlElement.getElement('btrainNo')?.innerText ?? '',
      recptnDt: DateTime.parse(
          xmlElement.getElement('recptnDt')?.innerText ?? '2999-12-31'),
      arvlMsg2: xmlElement.getElement('arvlMsg2')?.innerText ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RealtimeStationArrival &&
          other.runtimeType == runtimeType &&
          other.rowNum == rowNum &&
          other.totalCount == totalCount &&
          other.subwayId == subwayId &&
          other.updnLine == updnLine &&
          other.trainLineNm == trainLineNm &&
          other.statnNm == statnNm &&
          other.btrainSttus == btrainSttus &&
          other.btrainNo == btrainNo &&
          other.recptnDt == recptnDt &&
          other.arvlMsg2 == arvlMsg2;

  @override
  int get hashCode => Object.hash(rowNum, totalCount, subwayId, updnLine,
      trainLineNm, statnNm, btrainNo, recptnDt, arvlMsg2);

  @override
  String toString() {
    return 'RealtimeStationArrival(rowNum: $rowNum, totalCount: $totalCount, subwayId: $subwayId, updnLine: $updnLine, trainLineNm: $trainLineNm, statnNm: $statnNm, btrainSttus: $btrainSttus, btrainNo: $btrainNo, recptnDt: $recptnDt, arvlMsg2: $arvlMsg2)';
  }

  RealtimeStationArrival copyWith({
    int? rowNum,
    int? totalCount,
    String? subwayId,
    String? updnLine,
    String? trainLineNm,
    String? statnNm,
    String? btrainSttus,
    String? btrainNo,
    DateTime? recptnDt,
    String? arvlMsg2,
  }) {
    return RealtimeStationArrival(
      rowNum: rowNum ?? this.rowNum,
      totalCount: totalCount ?? this.totalCount,
      subwayId: subwayId ?? this.subwayId,
      updnLine: updnLine ?? this.updnLine,
      trainLineNm: trainLineNm ?? this.trainLineNm,
      statnNm: statnNm ?? this.statnNm,
      btrainSttus: btrainSttus ?? this.btrainSttus,
      btrainNo: btrainNo ?? this.btrainNo,
      recptnDt: recptnDt ?? this.recptnDt,
      arvlMsg2: arvlMsg2 ?? this.arvlMsg2,
    );
  }
}
