import 'package:xml/xml.dart';

class Subway {
  int rowNum;
  int subwayId;
  String trainLineNm;
  String ordkey;
  String recptnDt;

  Subway({
    required this.rowNum,
    required this.subwayId,
    required this.trainLineNm,
    required this.ordkey,
    required this.recptnDt,
  });

  Subway.fromXml(XmlElement element)
      : rowNum = int.parse(element.getElement('rowNum')?.innerText ?? '-1'),
        subwayId = int.parse(element.getElement('subwayId')?.innerText ?? '-1'),
        trainLineNm = element.getElement('trainLineNm')?.innerText ?? '',
        ordkey = element.getElement('ordkey')?.innerText ?? '',
        recptnDt = element.getElement('recptnDt')?.innerText ?? '';

  @override
  String toString() {
    return 'Subway{rowNum: $rowNum, subwayId: $subwayId, trainLineNm: $trainLineNm, ordkey: $ordkey, recptnDt: $recptnDt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subway &&
          runtimeType == other.runtimeType &&
          rowNum == other.rowNum &&
          subwayId == other.subwayId &&
          trainLineNm == other.trainLineNm &&
          ordkey == other.ordkey &&
          recptnDt == other.recptnDt;

  @override
  int get hashCode =>
      rowNum.hashCode ^
      subwayId.hashCode ^
      trainLineNm.hashCode ^
      ordkey.hashCode ^
      recptnDt.hashCode;

  Subway copyWith(
    int? rowNum,
    int? subwayId,
    String? trainLineNm,
    String? ordkey,
    String? recptnDt,
  ) {
    return Subway(
      rowNum: rowNum ?? this.rowNum,
      subwayId: subwayId ?? this.subwayId,
      trainLineNm: trainLineNm ?? this.trainLineNm,
      ordkey: ordkey ?? this.ordkey,
      recptnDt: recptnDt ?? this.recptnDt,
    );
  }
}
