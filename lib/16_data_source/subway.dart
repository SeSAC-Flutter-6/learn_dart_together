import 'package:xml/xml.dart' as xml;
import 'package:xml/xml.dart';

class SeoulSubway {
  final String? rowNum;
  final String? selectedCount;
  final int? totalCount;
  final String? subwayId;
  final String? updnLine;
  final String? trainLineNm;
  final String? statnFid;
  final String? statnNm;

  factory SeoulSubway.fromXml(XmlElement xml) {
    // 헬퍼 함수 정의
    String? getValue(String tag) {
      final element = xml.findElements(tag).firstWhere(
          //요소들 중 첫 번째로 innerText가 비어있지 않은 요소 찾기
          (e) => e.innerText.isNotEmpty, // 요소의 내용이 비어있지 않은지 확인
          orElse: () => XmlElement(XmlName(tag))); // 요소를 찾지 못하면 빈 요소를 반환
      return element.innerText.isNotEmpty ? element.innerText : null;
    }

    // SeoulSubway 객체 생성 및 반환
    return SeoulSubway(
      rowNum: getValue('rowNum'),
      selectedCount: getValue('selectedCount'),
      totalCount: int.parse(getValue('totalCount').toString()),
      subwayId: getValue('subwayId'),
      updnLine: getValue('updnLine'),
      trainLineNm: getValue('trainLineNm'),
      statnFid: getValue('statnFid'),
      statnNm: getValue('statnNm'),
    );
  }

  const SeoulSubway({
    this.rowNum,
    this.selectedCount,
    this.totalCount,
    this.subwayId,
    this.updnLine,
    this.trainLineNm,
    this.statnFid,
    this.statnNm,
  });

  @override
  String toString() {
    return 'SeoulSubway{rowNum: $rowNum, selectedCount: $selectedCount, totalCount: $totalCount, subwayId: $subwayId, updnLine: $updnLine, trainLineNm: $trainLineNm, statnFid: $statnFid, statnNm: $statnNm}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeoulSubway &&
          runtimeType == other.runtimeType &&
          rowNum == other.rowNum &&
          selectedCount == other.selectedCount &&
          totalCount == other.totalCount &&
          subwayId == other.subwayId &&
          updnLine == other.updnLine &&
          trainLineNm == other.trainLineNm &&
          statnFid == other.statnFid &&
          statnNm == other.statnNm;

  @override
  int get hashCode =>
      rowNum.hashCode ^
      selectedCount.hashCode ^
      totalCount.hashCode ^
      subwayId.hashCode ^
      updnLine.hashCode ^
      trainLineNm.hashCode ^
      statnFid.hashCode ^
      statnNm.hashCode;

  SeoulSubway copyWith({
    String? rowNum,
    String? selectedCount,
    int? totalCount,
    String? subwayId,
    String? updnLine,
    String? trainLineNm,
    String? statnFid,
    String? statnNm,
  }) {
    return SeoulSubway(
      rowNum: rowNum ?? this.rowNum,
      selectedCount: selectedCount ?? this.selectedCount,
      totalCount: totalCount ?? this.totalCount,
      subwayId: subwayId ?? this.subwayId,
      updnLine: updnLine ?? this.updnLine,
      trainLineNm: trainLineNm ?? this.trainLineNm,
      statnFid: statnFid ?? this.statnFid,
      statnNm: statnNm ?? this.statnNm,
    );
  }
// SeoulSubway.fromXml(XmlElement xmlEl)
//     : rowNum = xmlEl.getElement('rowNum')?.innerText,
//     selectedCount = xmlEl.getElement('selectedCount')?.innerText;
}
